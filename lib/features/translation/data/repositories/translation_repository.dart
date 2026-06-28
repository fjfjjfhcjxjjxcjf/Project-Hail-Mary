import 'dart:async';
import 'package:logger/logger.dart';
import '../../domain/entities/translation_job.dart';
import '../../domain/entities/ai_provider.dart';
import '../../domain/entities/glossary.dart';
import '../sources/translation_data_source.dart';

class TranslationRepository {
  final TranslationDataSource _dataSource;
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  TranslationRepository(this._dataSource);

  Future<String> translateChunk({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
    List<GlossaryEntry> glossary = const [],
    String previousContext = '',
  }) {
    return _dataSource.translateChunk(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profile: profile,
      provider: provider,
      customPrompt: customPrompt,
      glossary: glossary,
      previousContext: previousContext,
    );
  }

  Stream<String> translateChunkStream({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
  }) {
    return _dataSource.translateChunkStream(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profile: profile,
      provider: provider,
      customPrompt: customPrompt,
    );
  }

  List<String> chunkText(String text, int chunkSize) {
    if (text.length <= chunkSize) return [text];

    final chunks = <String>[];
    final paragraphs = text.split(RegExp(r'\n\s*\n'));
    var currentChunk = StringBuffer();

    for (final paragraph in paragraphs) {
      if (currentChunk.length + paragraph.length + 2 > chunkSize && currentChunk.isNotEmpty) {
        chunks.add(currentChunk.toString().trim());
        currentChunk = StringBuffer();
      }
      if (paragraph.length > chunkSize) {
        // Split long paragraphs by sentences
        final sentences = paragraph.split(RegExp(r'(?<=[.!?])\s+'));
        for (final sentence in sentences) {
          if (currentChunk.length + sentence.length + 1 > chunkSize && currentChunk.isNotEmpty) {
            chunks.add(currentChunk.toString().trim());
            currentChunk = StringBuffer();
          }
          if (currentChunk.isNotEmpty) currentChunk.write(' ');
          currentChunk.write(sentence);
        }
      } else {
        if (currentChunk.isNotEmpty) currentChunk.write('\n\n');
        currentChunk.write(paragraph);
      }
    }

    if (currentChunk.isNotEmpty) {
      chunks.add(currentChunk.toString().trim());
    }

    return chunks;
  }
}
