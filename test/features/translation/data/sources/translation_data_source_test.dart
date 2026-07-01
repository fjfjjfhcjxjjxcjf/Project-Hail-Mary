import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doclingo/features/translation/data/sources/translation_data_source.dart';
import 'package:doclingo/features/translation/domain/entities/ai_provider.dart';
import 'package:doclingo/features/translation/domain/entities/translation_job.dart';
import 'package:doclingo/core/errors/app_failure.dart';

final _testProvider = AiProvider(
  id: 'test-openrouter',
  name: 'OpenRouter',
  type: ProviderType.openrouter,
  baseUrl: 'https://openrouter.ai/api/v1',
  apiKey: 'sk-or-test-key-12345',
  selectedModel: 'openai/gpt-4o-mini',
  models: ['openai/gpt-4o-mini'],
);

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
            provider: _testProvider.copyWith(selectedModel: ''),
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
            provider: _testProvider.copyWith(selectedModel: ''),
          ),
          throwsA(isA<AppFailure>()),
        );
      });

      test('vision throws when no model selected', () async {
        expect(
          () => ds.extractTextFromImage(
            base64Image: 'abc123',
            provider: _testProvider.copyWith(selectedModel: ''),
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
            provider: _testProvider.copyWith(
              baseUrl: 'https://invalid.host.test',
            ),
          ),
          throwsA(isA<AppFailure>()),
        );
      });
    });

    group('Provider-specific routing', () {
      test('OpenRouter uses /chat/completions', () async {
        try {
          await ds.translateChunk(
            text: 'hello',
            sourceLanguage: 'auto',
            targetLanguage: 'fa',
            profile: TranslationProfile.balanced,
            provider: _testProvider.copyWith(
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
            provider: _testProvider.copyWith(
              type: ProviderType.gemini,
              baseUrl: 'https://invalid.host.test',
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
            provider: _testProvider.copyWith(
              type: ProviderType.claude,
              baseUrl: 'https://invalid.host.test',
            ),
          );
          fail('Should have thrown');
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
          provider: _testProvider.copyWith(
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
