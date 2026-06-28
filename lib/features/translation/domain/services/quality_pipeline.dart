import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/network/api_client.dart';
import '../entities/ai_provider.dart';
import '../entities/quality_report.dart';

const _uuid = Uuid();

/// Translation Quality Pipeline - AI-powered review, edit, proofread.
class QualityPipeline {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// Run a full quality check on translated text.
  Future<QualityReport> runFullCheck({
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    required AiProvider provider,
    required String jobId,
    Map<String, String> entityNames = const {},
  }) async {
    final checks = <QualityCheck>[];

    // 1. AI Review
    final review = await _runCheck(
      checkType: QualityCheckType.aiReview,
      sourceText: sourceText,
      translatedText: translatedText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      provider: provider,
      prompt: '''Review this translation for accuracy and naturalness.
Source ($sourceLanguage): $sourceText
Translation ($targetLanguage): $translatedText

Score 0-100 for quality. Return JSON: {"score": <number>, "feedback": "<brief feedback>", "issues": [{"message": "<issue>", "severity": "low|medium|high|critical"}]}''',
    );
    checks.add(review.$1);

    // 2. Consistency check
    if (entityNames.isNotEmpty) {
      final entityList = entityNames.entries
          .map((e) => '"${e.key}" should be "${e.value}"')
          .join('\n');
      final consistency = await _runCheck(
        checkType: QualityCheckType.consistencyCheck,
        sourceText: sourceText,
        translatedText: translatedText,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        provider: provider,
        prompt: '''Check if these character/entity names are used consistently:
$entityList

Translation: $translatedText

Return JSON: {"score": <0-100>, "feedback": "<feedback>", "issues": [{"message": "<issue>", "severity": "..."}]}''',
      );
      checks.add(consistency.$1);
    }

    // Calculate overall score
    final scores = checks.map((c) => c.score).where((s) => s > 0).toList();
    final overallScore = scores.isEmpty
        ? 0.0
        : scores.reduce((a, b) => a + b) / scores.length;

    final allIssues = <QualityIssue>[];
    for (final check in checks) {
      allIssues.addAll(check.feedback.isNotEmpty
          ? [QualityIssue(message: check.feedback, severity: IssueSeverity.low)]
          : []);
    }

    return QualityReport(
      id: _uuid.v4(),
      jobId: jobId,
      overallScore: overallScore,
      checks: checks,
      issues: allIssues,
      summary: 'Quality score: ${overallScore.toStringAsFixed(0)}/100',
      createdAt: DateTime.now(),
    );
  }

  Future<(QualityCheck, List<QualityIssue>)> _runCheck({
    required QualityCheckType checkType,
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    required AiProvider provider,
    required String prompt,
  }) async {
    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) client.setAuthToken(provider.apiKey);

      final response = await client.post<Map<String, dynamic>>(
        '/chat/completions',
        data: {
          'model': provider.selectedModel,
          'messages': [
            {'role': 'system', 'content': 'You are a translation quality reviewer. Return only JSON.'},
            {'role': 'user', 'content': prompt},
          ],
          'temperature': 0.1,
          'stream': false,
        },
      );

      final data = response.data;
      if (data == null) return (QualityCheck(type: checkType, score: 0), []);

      final content = (data['choices'] as List?)?.firstOrNull?['message']?['content'] as String? ?? '';
      String jsonStr = content;
      if (content.contains('```')) {
        final match = RegExp(r'```(?:json)?\s*([\s\S]*?)```').firstMatch(content);
        if (match != null) jsonStr = match.group(1)!.trim();
      }

      final parsed = jsonDecode(jsonStr) as Map<String, dynamic>;
      final issues = <QualityIssue>[];
      for (final issue in (parsed['issues'] as List? ?? [])) {
        issues.add(QualityIssue(
          message: issue['message'] ?? '',
          severity: IssueSeverity.values.firstWhere(
            (s) => s.name == issue['severity'],
            orElse: () => IssueSeverity.medium,
          ),
        ));
      }

      return (
        QualityCheck(
          type: checkType,
          score: (parsed['score'] ?? 0).toDouble(),
          feedback: parsed['feedback'] ?? '',
          issueCount: issues.length,
        ),
        issues,
      );
    } catch (e) {
      _logger.e('Quality check error: $e');
      return (QualityCheck(type: checkType, score: 0, feedback: 'Check failed: $e'), []);
    } finally {
      client.dispose();
    }
  }
}
