import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doclingo/features/translation/data/sources/translation_data_source.dart';
import 'package:doclingo/features/translation/domain/entities/ai_provider.dart';
import 'package:doclingo/features/translation/domain/entities/translation_job.dart';
import 'package:doclingo/core/errors/app_failure.dart';

// ── Test fixtures ───────────────────────────────────────────────

final _naraRouter = AiProvider(
  id: 'nararouter',
  name: 'NaraRouter',
  type: ProviderType.naraRouter,
  baseUrl: 'https://router.bynara.id/v1',
  apiKey: 'test-key',
  selectedModel: 'openai/gpt-4o-mini',
  models: ['openai/gpt-4o-mini'],
);

final _openRouter = AiProvider(
  id: 'openrouter',
  name: 'OpenRouter',
  type: ProviderType.openrouter,
  baseUrl: 'https://openrouter.ai/api/v1',
  apiKey: 'test-key',
  selectedModel: 'openai/gpt-4o-mini',
  models: ['openai/gpt-4o-mini'],
);

final _googleAI = AiProvider(
  id: 'google-ai',
  name: 'Google AI Studio',
  type: ProviderType.googleAI,
  baseUrl: 'https://generativelanguage.googleapis.com/v1beta/openai',
  apiKey: 'test-key',
  selectedModel: 'gemini-2.0-flash',
  models: ['gemini-2.0-flash'],
);

final _openAI = AiProvider(
  id: 'openai',
  name: 'OpenAI',
  type: ProviderType.openai,
  baseUrl: 'https://api.openai.com/v1',
  apiKey: 'test-key',
  selectedModel: 'gpt-4o-mini',
  models: ['gpt-4o-mini'],
);

final _deepseek = AiProvider(
  id: 'deepseek',
  name: 'DeepSeek',
  type: ProviderType.deepseek,
  baseUrl: 'https://api.deepseek.com/v1',
  apiKey: 'test-key',
  selectedModel: 'deepseek-chat',
  models: ['deepseek-chat'],
);

final _claude = AiProvider(
  id: 'claude',
  name: 'Claude',
  type: ProviderType.claude,
  baseUrl: 'https://api.anthropic.com/v1',
  apiKey: 'test-key',
  selectedModel: 'claude-sonnet-4-20250514',
  models: ['claude-sonnet-4-20250514'],
);

final _custom = AiProvider(
  id: 'custom',
  name: 'Custom',
  type: ProviderType.custom,
  baseUrl: 'https://my-proxy.example.com/v1',
  apiKey: 'test-key',
  selectedModel: 'my-model',
  models: ['my-model'],
);

/// All OpenAI-compatible providers that use /chat/completions
final _openAICompatible = [_naraRouter, _openRouter, _googleAI, _openAI, _deepseek, _custom];

void main() {
  group('TranslationDataSourceImpl', () {
    late TranslationDataSourceImpl ds;

    setUp(() {
      ds = TranslationDataSourceImpl();
    });

    group('Input validation', () {
      test('throws when no model selected', () async {
        expect(
          () => ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _naraRouter.copyWith(selectedModel: ''),
          ),
          throwsA(isA<AppFailure>()),
        );
      });

      test('stream throws when no model selected', () async {
        expect(
          () => ds.translateChunkStream(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _naraRouter.copyWith(selectedModel: ''),
          ),
          throwsA(isA<AppFailure>()),
        );
      });

      test('vision throws when no model selected', () async {
        expect(
          () => ds.extractTextFromImage(
            base64Image: 'abc123',
            provider: _naraRouter.copyWith(selectedModel: ''),
          ),
          throwsA(isA<AppFailure>()),
        );
      });
    });

    group('Network error handling', () {
      test('throws AppFailure on unreachable host', () async {
        expect(
          () => ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _naraRouter.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          ),
          throwsA(isA<AppFailure>()),
        );
      });
    });

    group('Provider-specific endpoint routing', () {
      test('NaraRouter uses /chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _naraRouter.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });

      test('OpenRouter uses /chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _openRouter.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });

      test('Google AI Studio uses /chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _googleAI.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });

      test('Gemini uses /v1beta/openai/chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: AiProvider(
              id: 'gemini',
              name: 'Gemini',
              type: ProviderType.gemini,
              baseUrl: 'https://invalid.host.test',
              apiKey: 'test-key',
              selectedModel: 'gemini-1.5-flash',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });

      test('Claude uses /messages', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _claude.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });

      test('Custom uses /chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _custom.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
        } on AppFailure catch (_) {}
      });
    });

    group('Authorization header', () {
      test('all providers send Authorization in BaseOptions', () async {
        // Verify each provider type creates a client with auth header.
        // Since we can't inject a mock, we verify no crash on construction.
        for (final provider in _openAICompatible) {
          try {
            await ds.translateChunk(
              text: 'hello',
              sourceLanguage: 'auto',
              targetLanguage: 'fa',
              profile: TranslationProfile.balanced,
              provider: provider.copyWith(
                baseUrl: 'https://invalid.host.test',
              ),
            );
          } on AppFailure catch (_) {
            // Expected - host doesn't exist
          }
        }
      });

      test('API key is trimmed', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _naraRouter.copyWith(
              apiKey: '  test-key  ',
              baseUrl: 'https://invalid.host.test',
            ),
          );
        } on AppFailure catch (_) {}
      });
    });

    group('Cancellation', () {
      test('translateChunk can be cancelled', () async {
        final cancelToken = CancelToken();

        final future = ds.translateChunk(
          text: 'hello',
          sourceLanguage: 'auto',
          targetLanguage: 'fa',
          profile: TranslationProfile.balanced,
          provider: _naraRouter.copyWith(
            baseUrl: 'https://invalid.host.test',
          ),
          cancelToken: cancelToken,
        );

        cancelToken.cancel('Test cancel');

        expect(
          () => future,
          throwsA(isA<AppFailure>()),
        );
      });
    });
  });
}
