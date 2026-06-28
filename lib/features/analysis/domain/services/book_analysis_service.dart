import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../core/network/api_client.dart';
import '../../../translation/domain/entities/ai_provider.dart';
import '../../../translation/domain/services/cost_optimizer.dart';

/// Book Analysis Service - analyzes documents before translation.
class BookAnalysisService {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  /// Analyze text and extract entities using an AI provider.
  Future<AnalysisResult> analyzeText({
    required String text,
    required String sourceLanguage,
    required AiProvider provider,
  }) async {
    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      final systemPrompt = '''You are a literary analysis assistant. Analyze the following text and extract structured information.

Return a JSON object with these fields:
{
  "word_count": <number>,
  "paragraph_count": <number>,
  "detected_language": "<language name>",
  "characters": [{"name": "<name>", "type": "character|place|organization|item|skill|magic_system|terminology|other", "occurrences": <count>, "aliases": ["<alias>"]}],
  "terms": [{"term": "<term>", "category": "<category>", "occurrences": <count>}],
  "summary": "<brief summary of the content>",
  "estimated_tokens": <number>
}

Return ONLY the JSON object, no other text.''';

      final textSample = text.length > 8000 ? text.substring(0, 8000) : text;

      final response = await client.post<Map<String, dynamic>>(
        '/chat/completions',
        data: {
          'model': provider.selectedModel,
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': 'Analyze this text:\n\n$textSample'},
          ],
          'temperature': 0.1,
          'stream': false,
        },
      );

      final data = response.data;
      if (data == null) return AnalysisResult.empty;

      final choices = data['choices'] as List? ?? [];
      if (choices.isEmpty) return AnalysisResult.empty;

      final content = choices[0]['message']['content'] as String;

      // Parse JSON from response (handle markdown code blocks)
      String jsonStr = content;
      if (content.contains('```')) {
        final match = RegExp(r'```(?:json)?\s*([\s\S]*?)```').firstMatch(content);
        if (match != null) jsonStr = match.group(1)!.trim();
      }

      final parsed = jsonDecode(jsonStr) as Map<String, dynamic>;

      final characters = <ExtractedCharacter>[];
      for (final c in (parsed['characters'] as List? ?? [])) {
        characters.add(ExtractedCharacter(
          name: c['name'] ?? '',
          type: c['type'] ?? 'other',
          occurrences: c['occurrences'] ?? 0,
          aliases: List<String>.from(c['aliases'] ?? []),
        ));
      }

      final terms = <ExtractedTermInfo>[];
      for (final t in (parsed['terms'] as List? ?? [])) {
        terms.add(ExtractedTermInfo(
          term: t['term'] ?? '',
          category: t['category'] ?? '',
          occurrences: t['occurrences'] ?? 0,
        ));
      }

      return AnalysisResult(
        wordCount: parsed['word_count'] ?? _countWords(text),
        paragraphCount: parsed['paragraph_count'] ?? _countParagraphs(text),
        detectedLanguage: parsed['detected_language'] ?? sourceLanguage,
        characters: characters,
        terms: terms,
        summary: parsed['summary'] ?? '',
        estimatedTokens: parsed['estimated_tokens'] ?? 0,
      );
    } on DioException catch (e) {
      _logger.e('Analysis API error: ${e.message}');
      // Return basic analysis without AI
      return AnalysisResult(
        wordCount: _countWords(text),
        paragraphCount: _countParagraphs(text),
        detectedLanguage: sourceLanguage,
      );
    } finally {
      client.dispose();
    }
  }

  /// Estimate translation cost based on token count and provider pricing.
  double estimateCost(int tokens, AiProvider provider) {
    // Use CostOptimizer for consistent pricing
    final characterCount = (tokens / 1.3).round(); // Approximate reverse
    return CostOptimizer.estimateCost(
      provider: provider,
      characterCount: characterCount,
    );
  }

  int _countWords(String text) {
    return text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  }

  int _countParagraphs(String text) {
    return text.split(RegExp(r'\n\s*\n')).where((p) => p.trim().isNotEmpty).length;
  }
}

class AnalysisResult {
  final int wordCount;
  final int paragraphCount;
  final String detectedLanguage;
  final List<ExtractedCharacter> characters;
  final List<ExtractedTermInfo> terms;
  final String summary;
  final int estimatedTokens;

  const AnalysisResult({
    this.wordCount = 0,
    this.paragraphCount = 0,
    this.detectedLanguage = '',
    this.characters = const [],
    this.terms = const [],
    this.summary = '',
    this.estimatedTokens = 0,
  });

  static const empty = AnalysisResult();
}

class ExtractedCharacter {
  final String name;
  final String type;
  final int occurrences;
  final List<String> aliases;

  const ExtractedCharacter({
    required this.name,
    required this.type,
    this.occurrences = 0,
    this.aliases = const [],
  });
}

class ExtractedTermInfo {
  final String term;
  final String category;
  final int occurrences;

  const ExtractedTermInfo({
    required this.term,
    this.category = '',
    this.occurrences = 0,
  });
}
