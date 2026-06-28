/// Bilingual Export Service - exports translations in various formats.
enum ExportFormat { originalOnly, translationOnly, bilingual, sideBySide }

class ExportService {
  ExportService._();

  /// Export translation as plain text.
  static String exportAsText({
    required String originalText,
    required String translatedText,
    required ExportFormat format,
  }) {
    switch (format) {
      case ExportFormat.originalOnly:
        return originalText;
      case ExportFormat.translationOnly:
        return translatedText;
      case ExportFormat.bilingual:
        return _bilingualText(originalText, translatedText);
      case ExportFormat.sideBySide:
        return _sideBySideText(originalText, translatedText);
    }
  }

  /// Export as HTML.
  static String exportAsHtml({
    required String originalText,
    required String translatedText,
    required ExportFormat format,
    required String sourceLanguage,
    required String targetLanguage,
    String title = 'DocLingo Translation',
  }) {
    final buffer = StringBuffer();
    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html><head><meta charset="utf-8">');
    buffer.writeln('<title>$title</title>');
    buffer.writeln('<style>');
    buffer.writeln('body { font-family: sans-serif; margin: 2em; line-height: 1.6; }');
    buffer.writeln('.original { color: #666; margin-bottom: 0.5em; }');
    buffer.writeln('.translated { color: #000; margin-bottom: 1.5em; }');
    buffer.writeln('.side-by-side { display: grid; grid-template-columns: 1fr 1fr; gap: 2em; }');
    buffer.writeln('.bilingual-pair { border-bottom: 1px solid #eee; padding: 0.5em 0; }');
    buffer.writeln('</style></head><body>');
    buffer.writeln('<h1>$title</h1>');

    switch (format) {
      case ExportFormat.originalOnly:
        buffer.writeln('<div dir="${_direction(sourceLanguage)}">');
        buffer.writeln(_toHtml(originalText));
        buffer.writeln('</div>');
        break;
      case ExportFormat.translationOnly:
        buffer.writeln('<div dir="${_direction(targetLanguage)}">');
        buffer.writeln(_toHtml(translatedText));
        buffer.writeln('</div>');
        break;
      case ExportFormat.bilingual:
        final origParas = originalText.split('\n\n');
        final transParas = translatedText.split('\n\n');
        for (int i = 0; i < origParas.length && i < transParas.length; i++) {
          buffer.writeln('<div class="bilingual-pair">');
          buffer.writeln('<div class="original" dir="${_direction(sourceLanguage)}">${_toHtml(origParas[i])}</div>');
          buffer.writeln('<div class="translated" dir="${_direction(targetLanguage)}">${_toHtml(transParas[i])}</div>');
          buffer.writeln('</div>');
        }
        break;
      case ExportFormat.sideBySide:
        buffer.writeln('<div class="side-by-side">');
        buffer.writeln('<div><h2>$sourceLanguage</h2>${_toHtml(originalText)}</div>');
        buffer.writeln('<div><h2>$targetLanguage</h2>${_toHtml(translatedText)}</div>');
        buffer.writeln('</div>');
        break;
    }

    buffer.writeln('</body></html>');
    return buffer.toString();
  }

  /// Export as Markdown.
  static String exportAsMarkdown({
    required String originalText,
    required String translatedText,
    required ExportFormat format,
    required String sourceLanguage,
    required String targetLanguage,
    String title = 'DocLingo Translation',
  }) {
    final buffer = StringBuffer();
    buffer.writeln('# $title\n');

    switch (format) {
      case ExportFormat.originalOnly:
        buffer.writeln(originalText);
        break;
      case ExportFormat.translationOnly:
        buffer.writeln(translatedText);
        break;
      case ExportFormat.bilingual:
        final origParas = originalText.split('\n\n');
        final transParas = translatedText.split('\n\n');
        for (int i = 0; i < origParas.length && i < transParas.length; i++) {
          buffer.writeln('> ${origParas[i].replaceAll('\n', '\n> ')}\n');
          buffer.writeln('${transParas[i]}\n');
          buffer.writeln('---\n');
        }
        break;
      case ExportFormat.sideBySide:
        buffer.writeln('| $sourceLanguage | $targetLanguage |');
        buffer.writeln('|---|---|');
        final origParas = originalText.split('\n\n');
        final transParas = translatedText.split('\n\n');
        for (int i = 0; i < origParas.length && i < transParas.length; i++) {
          final orig = origParas[i].replaceAll('\n', '<br>');
          final trans = transParas[i].replaceAll('\n', '<br>');
          buffer.writeln('| $orig | $trans |');
        }
        break;
    }

    return buffer.toString();
  }

  static String _bilingualText(String original, String translated) {
    final origParas = original.split('\n\n');
    final transParas = translated.split('\n\n');
    final buffer = StringBuffer();
    for (int i = 0; i < origParas.length && i < transParas.length; i++) {
      buffer.writeln(origParas[i]);
      buffer.writeln(transParas[i]);
      if (i < origParas.length - 1) buffer.writeln();
    }
    return buffer.toString();
  }

  static String _sideBySideText(String original, String translated) {
    return '=== ORIGINAL ===\n$original\n\n=== TRANSLATION ===\n$translated';
  }

  static String _direction(String language) {
    const rtlLanguages = ['fa', 'ar', 'he', 'ur', 'yi'];
    if (rtlLanguages.any((l) => language.toLowerCase().contains(l))) return 'rtl';
    return 'ltr';
  }

  static String _toHtml(String text) {
    return text
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('\n\n', '</p><p>')
        .replaceAll('\n', '<br>');
  }
}
