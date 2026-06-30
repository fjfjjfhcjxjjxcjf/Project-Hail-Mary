import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../domain/entities/ai_provider.dart';
import '../../domain/entities/translation_job.dart';
import '../../domain/entities/glossary.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/network/api_client.dart';

abstract class TranslationDataSource {
  Future<String> translateChunk({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
    List<GlossaryEntry> glossary = const [],
    String previousContext = '',
  });
  Stream<String> translateChunkStream({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
  });
  Future<String> extractTextFromImage({
    required String base64Image,
    required AiProvider provider,
  });
}

class TranslationDataSourceImpl implements TranslationDataSource {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  Future<String> translateChunk({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
    List<GlossaryEntry> glossary = const [],
    String previousContext = '',
  }) async {
    if (provider.selectedModel.isEmpty) {
      throw const AppFailure.translation(
        message: 'No model selected. Please select a model in Provider settings.',
      );
    }

    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      final systemPrompt = _buildSystemPrompt(
        profile: profile,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        customPrompt: customPrompt,
        glossary: glossary,
      );

      final userContent = previousContext.isNotEmpty
          ? 'Previous context for continuity:\n$previousContext\n\n---\n\nText to translate:\n$text'
          : text;

      final response = await client.post<Map<String, dynamic>>(
        '/chat/completions',
        data: {
          'model': provider.selectedModel,
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': userContent},
          ],
          'temperature': 0.3,
          'stream': false,
        },
      );

      final data = response.data;
      if (data == null) throw const AppFailure.translation(message: 'Empty response');
      final choices = data['choices'] as List?;
      if (choices == null || choices.isEmpty) throw const AppFailure.translation(message: 'No choices in response');
      return choices[0]['message']['content'] as String;
    } on DioException catch (e) {
      _logger.e('Translation API error: ${e.message}');
      throw mapDioException(e);
    } catch (e) {
      _logger.e('Translation error: $e');
      throw AppFailure.translation(message: e.toString());
    } finally {
      client.dispose();
    }
  }

  @override
  Stream<String> translateChunkStream({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
  }) async* {
    if (provider.selectedModel.isEmpty) {
      throw const AppFailure.translation(
        message: 'No model selected. Please select a model in Provider settings.',
      );
    }

    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      final systemPrompt = _buildSystemPrompt(
        profile: profile,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        customPrompt: customPrompt,
      );

      final response = await client.dio.post<ResponseBody>(
        '/chat/completions',
        data: {
          'model': provider.selectedModel,
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': text},
          ],
          'temperature': 0.3,
          'stream': true,
        },
        options: Options(responseType: ResponseType.stream),
      );

      final stream = response.data?.stream;
      if (stream == null) return;

      String buffer = '';
      await for (final chunk in stream) {
        buffer += String.fromCharCodes(chunk);
        while (buffer.contains('\n')) {
          final index = buffer.indexOf('\n');
          final line = buffer.substring(0, index).trim();
          buffer = buffer.substring(index + 1);
          if (line.startsWith('data: ') && line != 'data: [DONE]') {
            try {
              final json = line.substring(6);
              // Simple JSON parsing for content delta
              final contentMatch = RegExp(r'"content"\s*:\s*"((?:[^"\\]|\\.)*)"\s*').firstMatch(json);
              if (contentMatch != null) {
                final content = contentMatch.group(1)!
                    .replaceAll('\\n', '\n')
                    .replaceAll('\\t', '\t')
                    .replaceAll('\\"', '"')
                    .replaceAll('\\\\', '\\');
                yield content;
              }
            } catch (_) {}
          }
        }
      }
    } finally {
      client.dispose();
    }
  }

  @override
  Future<String> extractTextFromImage({
    required String base64Image,
    required AiProvider provider,
  }) async {
    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      final response = await client.post<Map<String, dynamic>>(
        '/chat/completions',
        data: {
          'model': provider.selectedModel,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'text',
                  'text': 'Extract all text from this image. '
                      'Return ONLY the extracted text, preserving the original layout and formatting. '
                      'Do not add any commentary or explanation.',
                },
                {
                  'type': 'image_url',
                  'image_url': {
                    'url': 'data:image/jpeg;base64,$base64Image',
                  },
                },
              ],
            },
          ],
          'temperature': 0.1,
          'max_tokens': 4096,
        },
      );

      final data = response.data;
      if (data == null) throw const AppFailure.translation(message: 'Empty response from vision API');
      final choices = data['choices'] as List?;
      if (choices == null || choices.isEmpty) throw const AppFailure.translation(message: 'No choices in vision response');
      return choices[0]['message']['content'] as String;
    } on DioException catch (e) {
      _logger.e('Vision API error: ${e.message}');
      throw mapDioException(e);
    } catch (e) {
      _logger.e('Vision error: $e');
      throw AppFailure.translation(message: 'Image text extraction failed: $e');
    } finally {
      client.dispose();
    }
  }

  String _buildSystemPrompt({
    required TranslationProfile profile,
    required String sourceLanguage,
    required String targetLanguage,
    String customPrompt = '',
    List<GlossaryEntry> glossary = const [],
  }) {
    final basePrompt = profile == TranslationProfile.custom && customPrompt.isNotEmpty
        ? customPrompt
        : profile.systemPrompt;

    final buffer = StringBuffer(basePrompt);
    buffer.writeln('\n\nTranslate from $sourceLanguage to $targetLanguage.');
    buffer.writeln('Return ONLY the translated text. No explanations, no notes, no commentary.');

    if (glossary.isNotEmpty) {
      buffer.writeln('\nUse these glossary terms consistently:');
      for (final entry in glossary) {
        buffer.writeln('  "${entry.sourceTerm}" => "${entry.targetTerm}"');
      }
    }

    return buffer.toString();
  }
}
