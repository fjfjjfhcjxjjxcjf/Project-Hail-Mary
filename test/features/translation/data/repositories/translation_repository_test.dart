import 'package:flutter_test/flutter_test.dart';
import 'package:doclingo/features/translation/data/repositories/translation_repository.dart';
import 'package:doclingo/features/translation/data/sources/translation_data_source.dart';

void main() {
  group('TranslationRepository.chunkText', () {
    late TranslationRepository repo;

    setUp(() {
      // chunkText is a pure function — no data source needed for this test.
      // We pass a dummy; we won't call translateChunk.
      repo = TranslationRepository(FakeDataSource());
    });

    test('returns single chunk for short text', () {
      final chunks = repo.chunkText('hello', 2000);
      expect(chunks, ['hello']);
    });

    test('splits on paragraph boundaries', () {
      final text = 'Paragraph one.\n\nParagraph two.\n\nParagraph three.';
      final chunks = repo.chunkText(text, 30);
      expect(chunks.length, greaterThan(1));
      // All original content should be preserved
      final rejoined = chunks.join('\n\n');
      expect(rejoined.contains('Paragraph one'), true);
      expect(rejoined.contains('Paragraph two'), true);
      expect(rejoined.contains('Paragraph three'), true);
    });

    test('handles empty text', () {
      final chunks = repo.chunkText('', 2000);
      expect(chunks, ['']);
    });

    test('handles text exactly at chunk size', () {
      final text = 'a' * 2000;
      final chunks = repo.chunkText(text, 2000);
      expect(chunks, [text]);
    });

    test('handles text slightly over chunk size', () {
      final text = 'a' * 2001;
      final chunks = repo.chunkText(text, 2000);
      expect(chunks.length, greaterThanOrEqualTo(1));
    });
  });
}

/// Minimal fake for testing chunkText (which doesn't touch the data source).
class FakeDataSource implements TranslationDataSource {
  @override
  noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
