import 'package:flutter_test/flutter_test.dart';
import 'package:doclingo/features/translation/domain/entities/translation_job.dart';
import 'package:doclingo/features/translation/domain/entities/ai_provider.dart';

/// Deep-convert a Map<dynamic, dynamic> (from Hive) to Map<String, dynamic>
/// so that generated fromJson() methods don't crash on type casts.
Map<String, dynamic> asJsonMap(Map raw) {
  return raw.map((k, v) => MapEntry(k.toString(), deepConvert(v)));
}

/// Recursively convert Hive's dynamic values to JSON-compatible types.
dynamic deepConvert(dynamic v) {
  if (v is Map) return v.map((k, val) => MapEntry(k.toString(), deepConvert(val)));
  if (v is List) return v.map(deepConvert).toList();
  return v;
}

void main() {
  group('Deep map conversion', () {
    test('converts Map<dynamic, dynamic> to Map<String, dynamic>', () {
      final hiveData = <dynamic, dynamic>{
        'id': 'test-id',
        'name': 'Test',
        'nested': <dynamic, dynamic>{
          'key': 'value',
          'deeper': <dynamic, dynamic>{'a': 1},
        },
        'list': <dynamic>[
          <dynamic, dynamic>{'x': 1},
          <dynamic, dynamic>{'x': 2},
        ],
      };

      final result = asJsonMap(hiveData);

      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], 'test-id');
      expect(result['name'], 'Test');

      final nested = result['nested'];
      expect(nested, isA<Map<String, dynamic>>());
      expect((nested as Map<String, dynamic>)['key'], 'value');

      final deeper = nested['deeper'];
      expect(deeper, isA<Map<String, dynamic>>());
      expect((deeper as Map<String, dynamic>)['a'], 1);

      final list = result['list'] as List;
      expect(list.length, 2);
      expect(list[0], isA<Map<String, dynamic>>());
      expect(list[1], isA<Map<String, dynamic>>());
    });

    test('handles null values', () {
      final data = <dynamic, dynamic>{'a': null, 'b': 42};
      final result = asJsonMap(data);
      expect(result['a'], isNull);
      expect(result['b'], 42);
    });

    test('handles empty map', () {
      final result = asJsonMap(<dynamic, dynamic>{});
      expect(result, isEmpty);
    });
  });

  group('TranslationJob round-trip', () {
    test('toJson preserves TranslatedChunk data', () {
      final job = TranslationJob(
        id: 'test-job-1',
        documentId: 'doc-1',
        documentName: 'Test Document',
        sourceLanguage: 'auto',
        targetLanguage: 'fa',
        profile: TranslationProfile.balanced,
        status: TranslationStatus.completed,
        progress: 1.0,
        createdAt: DateTime(2026, 6, 30),
        completedAt: DateTime(2026, 6, 30, 0, 1),
        chunks: [
          const TranslatedChunk(
            id: 'chunk-1',
            index: 0,
            originalText: 'hello',
            translatedText: 'سلام',
            isComplete: true,
          ),
        ],
        providerId: 'openrouter',
      );

      final json = job.toJson();
      expect(json['id'], 'test-job-1');
      expect(json['chunks'], isA<List>());

      // Verify chunks are serialized as maps, not raw TranslatedChunk objects
      final chunks = json['chunks'] as List;
      expect(chunks.length, 1);
      expect(chunks[0], isA<Map>());
    });

    test('fromJson handles dynamic maps from Hive', () {
      // Simulate Hive data: Map<dynamic, dynamic> with nested maps
      final hiveData = <dynamic, dynamic>{
        'id': 'test-job-1',
        'documentId': 'doc-1',
        'documentName': 'Test Document',
        'sourceLanguage': 'auto',
        'targetLanguage': 'fa',
        'profile': 'balanced',
        'status': 'completed',
        'progress': 1.0,
        'customPrompt': '',
        'providerId': 'openrouter',
        'createdAt': '2026-06-30T00:00:00.000',
        'completedAt': '2026-06-30T00:01:00.000',
        'chunks': <dynamic>[
          <dynamic, dynamic>{
            'id': 'chunk-1',
            'index': 0,
            'originalText': 'hello',
            'translatedText': 'سلام',
            'isComplete': true,
            'isReviewed': false,
            'errorMessage': null,
          },
        ],
        'errorMessage': null,
        'useGlossary': false,
        'useContextAware': false,
      };

      // Convert like LocalStorageService._asJsonMap does
      final json = asJsonMap(hiveData);

      // This should NOT throw: type '_Map<dynamic, dynamic>' is not a subtype
      final restored = TranslationJob.fromJson(json);

      expect(restored.id, 'test-job-1');
      expect(restored.chunks.length, 1);
      expect(restored.chunks[0].originalText, 'hello');
      expect(restored.chunks[0].translatedText, 'سلام');
      expect(restored.chunks[0].isComplete, true);
      expect(restored.status, TranslationStatus.completed);
    });

    test('fromJson with empty chunks', () {
      final hiveData = <dynamic, dynamic>{
        'id': 'empty-job',
        'documentId': '',
        'documentName': 'Text Input',
        'sourceLanguage': 'auto',
        'targetLanguage': 'fa',
        'profile': 'balanced',
        'status': 'pending',
        'progress': 0.0,
        'customPrompt': '',
        'providerId': '',
        'createdAt': '2026-01-01T00:00:00.000',
        'chunks': <dynamic>[],
        'errorMessage': null,
        'useGlossary': false,
        'useContextAware': false,
      };

      final json = asJsonMap(hiveData);
      final restored = TranslationJob.fromJson(json);
      expect(restored.chunks, isEmpty);
    });

    test('fromJson with failed status', () {
      final hiveData = <dynamic, dynamic>{
        'id': 'failed-job',
        'documentId': '',
        'documentName': 'Text Input',
        'sourceLanguage': 'auto',
        'targetLanguage': 'fa',
        'profile': 'balanced',
        'status': 'failed',
        'progress': 0.0,
        'customPrompt': '',
        'providerId': '',
        'createdAt': '2026-01-01T00:00:00.000',
        'chunks': <dynamic>[
          <dynamic, dynamic>{
            'id': 'c1',
            'index': 0,
            'originalText': 'hello',
            'translatedText': '',
            'isComplete': false,
            'isReviewed': false,
            'errorMessage': 'Auth failed',
          },
        ],
        'errorMessage': 'Authentication failed (HTTP 401)',
        'useGlossary': false,
        'useContextAware': false,
      };

      final json = asJsonMap(hiveData);
      final restored = TranslationJob.fromJson(json);

      expect(restored.status, TranslationStatus.failed);
      expect(restored.errorMessage, 'Authentication failed (HTTP 401)');
      expect(restored.chunks[0].isComplete, false);
      expect(restored.chunks[0].errorMessage, 'Auth failed');
    });
  });

  group('AiProvider round-trip', () {
    test('fromJson handles dynamic maps from Hive', () {
      final hiveData = <dynamic, dynamic>{
        'id': 'openrouter',
        'name': 'OpenRouter',
        'type': 'openrouter',
        'baseUrl': 'https://openrouter.ai/api/v1',
        'apiKey': 'sk-or...',
        'models': <dynamic>['openai/gpt-4o-mini'],
        'selectedModel': 'openai/gpt-4o-mini',
        'isActive': true,
        'supportsStreaming': false,
        'supportsVision': false,
        'maxContextLength': 4096,
        'metadata': <dynamic, dynamic>{'custom': true, 'count': 42},
      };

      final json = asJsonMap(hiveData);
      final restored = AiProvider.fromJson(json);

      expect(restored.id, 'openrouter');
      expect(restored.name, 'OpenRouter');
      expect(restored.type, ProviderType.openrouter);
      expect(restored.apiKey, 'sk-or...');
      expect(restored.selectedModel, 'openai/gpt-4o-mini');
      expect(restored.metadata, isA<Map<String, dynamic>>());
    });
  });
}
