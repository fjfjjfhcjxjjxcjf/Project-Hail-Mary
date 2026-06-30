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
    CancelToken? cancelToken,
  });
  Stream<String> translateChunkStream({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
    CancelToken? cancelToken,
  });
  Future<String> extractTextFromImage({
    required String base64Image,
    required AiProvider provider,
    CancelToken? cancelToken,
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
    CancelToken? cancelToken,
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

      final requestBody = _buildChatRequest(
        provider: provider,
        systemPrompt: systemPrompt,
        userContent: userContent,
        stream: false,
      );

      final endpoint = _chatEndpoint(provider);

      final response = await client.post<Map<String, dynamic>>(
        endpoint,
        data: requestBody,
        cancelToken: cancelToken,
      );

      final data = response.data;
      if (data == null) throw const AppFailure.translation(message: 'Empty response');
      return _parseChatResponse(data, provider);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw const AppFailure.translation(message: 'Translation cancelled');
      }
      _logger.e('Translation API error: ${e.message}');
      throw mapDioException(e);
    } on AppFailure {
      rethrow;
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
    CancelToken? cancelToken,
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

      final requestBody = _buildChatRequest(
        provider: provider,
        systemPrompt: systemPrompt,
        userContent: text,
        stream: true,
      );

      final endpoint = _chatEndpoint(provider);

      final response = await client.dio.post<ResponseBody>(
        endpoint,
        data: requestBody,
        options: Options(responseType: ResponseType.stream),
        cancelToken: cancelToken,
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
              final contentMatch = RegExp(r'"content"\s*:\s*"((?:[^"\\]|\\.)*)"').firstMatch(json);
              if (contentMatch != null) {
                final content = contentMatch.group(1)!
                    .replaceAll('\\n', '\n')
                    .replaceAll('\\t', '\t')
                    .replaceAll('\\"', '"')
                    .replaceAll('\\\\', '\\');
                yield content;
              }
            } catch (e) {
              // Log but do not abort the stream — a single malformed SSE
              // chunk should not kill the entire translation.
              _logger.w('Failed to parse SSE chunk: $e\n  line: $line');
            }
          }
        }
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw const AppFailure.translation(message: 'Translation cancelled');
      }
      throw mapDioException(e);
    } finally {
      client.dispose();
    }
  }

  @override
  Future<String> extractTextFromImage({
    required String base64Image,
    required AiProvider provider,
    CancelToken? cancelToken,
  }) async {
    final client = ApiClient(baseUrl: provider.baseUrl);
    try {
      if (provider.apiKey.isNotEmpty) {
        client.setAuthToken(provider.apiKey);
      }

      final requestBody = _buildVisionRequest(
        provider: provider,
        base64Image: base64Image,
      );

      final endpoint = _chatEndpoint(provider);

      final response = await client.post<Map<String, dynamic>>(
        endpoint,
        data: requestBody,
        cancelToken: cancelToken,
      );

      final data = response.data;
      if (data == null) throw const AppFailure.translation(message: 'Empty response from vision API');
      return _parseChatResponse(data, provider);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw const AppFailure.translation(message: 'Image extraction cancelled');
      }
      _logger.e('Vision API error: ${e.message}');
      throw mapDioException(e);
    } on AppFailure {
      rethrow;
    } catch (e) {
      _logger.e('Vision error: $e');
      throw AppFailure.translation(message: 'Image text extraction failed: $e');
    } finally {
      client.dispose();
    }
  }

  // ── Provider-specific API routing ─────────────────────────────

  /// Returns the correct chat completion endpoint for the provider.
  String _chatEndpoint(AiProvider provider) {
    switch (provider.type) {
      case ProviderType.gemini:
        // Google's OpenAI-compatible endpoint
        return '/v1beta/openai/chat/completions';
      case ProviderType.claude:
        // Anthropic Messages API (different from OpenAI format)
        return '/messages';
      default:
        // OpenAI-compatible providers (OpenAI, DeepSeek, OpenRouter,
        // Ollama, LM Studio, and all custom providers)
        return '/chat/completions';
    }
  }

  /// Build the request body, adapting to provider-specific API formats.
  Map<String, dynamic> _buildChatRequest({
    required AiProvider provider,
    required String systemPrompt,
    required String userContent,
    required bool stream,
  }) {
    switch (provider.type) {
      case ProviderType.claude:
        // Anthropic Messages API format
        return {
          'model': provider.selectedModel,
          'max_tokens': 4096,
          'system': systemPrompt,
          'messages': [
            {'role': 'user', 'content': userContent},
          ],
          'stream': stream,
        };
      default:
        // OpenAI-compatible format (works for OpenAI, Gemini via /v1beta/openai,
        // DeepSeek, OpenRouter, Ollama, LM Studio, and all custom providers)
        return {
          'model': provider.selectedModel,
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': userContent},
          ],
          'temperature': 0.3,
          'stream': stream,
        };
    }
  }

  /// Build a vision/OCR request body.
  Map<String, dynamic> _buildVisionRequest({
    required AiProvider provider,
    required String base64Image,
  }) {
    switch (provider.type) {
      case ProviderType.claude:
        return {
          'model': provider.selectedModel,
          'max_tokens': 4096,
          'messages': [
            {
              'role': 'user',
              'content': [
                {
                  'type': 'image',
                  'source': {
                    'type': 'base64',
                    'media_type': 'image/jpeg',
                    'data': base64Image,
                  },
                },
                {
                  'type': 'text',
                  'text': 'Extract all text from this image. '
                      'Return ONLY the extracted text, preserving the original layout and formatting. '
                      'Do not add any commentary or explanation.',
                },
              ],
            },
          ],
        };
      default:
        return {
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
        };
    }
  }

  /// Parse the chat response, handling provider-specific response formats.
  String _parseChatResponse(Map<String, dynamic> data, AiProvider provider) {
    if (provider.type == ProviderType.claude) {
      // Anthropic Messages API response: { "content": [{"type": "text", "text": "..."}] }
      final content = data['content'] as List?;
      if (content == null || content.isEmpty) {
        throw const AppFailure.translation(message: 'Empty response from Claude');
      }
      final textParts = content
          .where((c) => c is Map && c['type'] == 'text')
          .map((c) => c['text'] as String)
          .toList();
      if (textParts.isEmpty) {
        throw const AppFailure.translation(message: 'No text content in Claude response');
      }
      return textParts.join('\n');
    }

    // OpenAI-compatible response: { "choices": [{"message": {"content": "..."}}] }
    final choices = data['choices'] as List?;
    if (choices == null || choices.isEmpty) {
      throw const AppFailure.translation(message: 'No choices in response');
    }
    return choices[0]['message']['content'] as String;
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
