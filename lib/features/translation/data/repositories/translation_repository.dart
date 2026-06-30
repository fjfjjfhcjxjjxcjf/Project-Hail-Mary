import 'dart:async';
import 'package:dio/dio.dart';
import '../../domain/entities/translation_job.dart';
import '../../domain/entities/ai_provider.dart';
import '../../domain/entities/glossary.dart';
import '../sources/translation_data_source.dart';
import '../../../../core/debug/debug_log.dart';

class TranslationRepository {
  final TranslationDataSource _dataSource;

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
    CancelToken? cancelToken,
  }) {
    dlog('REPO', 'translateChunk ENTRY — provider=${provider.name}, text=${text.length} chars');
    return _dataSource.translateChunk(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profile: profile,
      provider: provider,
      customPrompt: customPrompt,
      glossary: glossary,
      previousContext: previousContext,
      cancelToken: cancelToken,
    );
  }

  Stream<String> translateChunkStream({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    required AiProvider provider,
    String customPrompt = '',
    CancelToken? cancelToken,
  }) {
    dlog('REPO', 'translateChunkStream ENTRY');
    return _dataSource.translateChunkStream(
      text: text,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profile: profile,
      provider: provider,
      customPrompt: customPrompt,
      cancelToken: cancelToken,
    );
  }

  Future<String> extractTextFromImage({
    required String base64Image,
    required AiProvider provider,
    CancelToken? cancelToken,
  }) {
    dlog('REPO', 'extractTextFromImage ENTRY');
    return _dataSource.extractTextFromImage(
      base64Image: base64Image,
      provider: provider,
      cancelToken: cancelToken,
    );
  }

  List<String> chunkText(String text, int chunkSize) {
    dlog('REPO', 'chunkText ENTRY — text=${text.length} chars, chunkSize=$chunkSize');
    if (text.length <= chunkSize) {
      dlog('REPO', '  single chunk');
      return [text];
    }

    final chunks = <String>[];
    final paragraphs = text.split(RegExp(r'\n\s*\n'));
    var currentChunk = StringBuffer();

    for (final paragraph in paragraphs) {
      if (currentChunk.length + paragraph.length + 2 > chunkSize && currentChunk.isNotEmpty) {
        chunks.add(currentChunk.toString().trim());
        currentChunk = StringBuffer();
      }
      if (paragraph.length > chunkSize) {
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

    dlog('REPO', '  produced ${chunks.length} chunk(s)');
    return chunks;
  }
}
