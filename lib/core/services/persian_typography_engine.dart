/// Persian Typography Engine - auto-corrects Persian/Farsi text issues.
class PersianTypographyEngine {
  PersianTypographyEngine._();

  /// Apply all Persian typography corrections to text.
  static String correct(String text) {
    if (!isPersianText(text)) return text;
    text = _normalizeUnicode(text);
    text = _fixHalfSpaces(text);
    text = _fixPunctuation(text);
    text = _fixNumbers(text);
    text = _fixQuotationMarks(text);
    text = _fixKashida(text);
    return text;
  }

  /// Normalize Unicode characters (Arabic vs Persian forms).
  static String _normalizeUnicode(String text) {
    text = text.replaceAll('\u0643', '\u06A9'); // ك -> ک (Arabic to Persian kaf)
    text = text.replaceAll('\u064A', '\u06CC'); // ي -> ی (Arabic to Persian yeh)
    text = text.replaceAll('\u0629', '\u0647'); // ة -> ه (ta marbuta to heh)
    text = text.replaceAll('\u0649', '\u06CC'); // ى -> ی
    return text;
  }

  /// Fix half-spaces (zero-width non-joiner) in Persian text.
  static String _fixHalfSpaces(String text) {
    // Common prefixes that need half-space before the word
    final prefixes = [
      'می', 'نمی', 'بر', 'در', 'از', 'به', 'با', 'بی',
      'ها', 'های', 'تر', 'ترین', 'ام', 'ات', 'اش',
      'هاش', 'هاشان', 'هایش', 'هایشان',
    ];

    for (final prefix in prefixes) {
      // Add half-space between word and prefix when missing
      final pattern = RegExp('($prefix)(\\s)([آ-ی])');
      text = text.replaceAllMapped(pattern, (m) {
        return '${m.group(1)}\u200C${m.group(3)}';
      });
    }

    // Remove extra spaces around existing half-spaces
    text = text.replaceAll(RegExp(r'\s\u200C'), '\u200C');
    text = text.replaceAll(RegExp(r'\u200C\s'), '\u200C');

    return text;
  }

  /// Fix Persian punctuation marks.
  static String _fixPunctuation(String text) {
    // Replace Arabic comma with Persian comma
    text = text.replaceAll('\u060C', '\u060C'); // Arabic comma (keep as-is, same glyph)
    // Ensure proper Persian question mark
    text = text.replaceAll('?', '\u061F'); // ? -> ؟
    // Fix semicolon
    text = text.replaceAll(';', '\u061B'); // ; -> ؛
    return text;
  }

  /// Convert Western digits to Persian digits.
  static String _fixNumbers(String text) {
    const western = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      final ch = text[i];
      final idx = western.indexOf(ch);
      if (idx >= 0) {
        buffer.write(persian[idx]);
      } else {
        buffer.write(ch);
      }
    }
    return buffer.toString();
  }

  /// Fix quotation marks to Persian style.
  static String _fixQuotationMarks(String text) {
    text = text.replaceAll('"', '\u00AB'); // " -> «
    text = text.replaceAll('"', '\u00BB'); // " -> »
    return text;
  }

  /// Normalize Kashida (tatweel) usage.
  static String _fixKashida(String text) {
    // Remove excessive kashida
    text = text.replaceAll(RegExp(r'\u0640{2,}'), '\u0640');
    return text;
  }

  /// Check if text contains Persian/Arabic characters.
  static bool isPersianText(String text) {
    return RegExp(r'[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]')
        .hasMatch(text);
  }

  /// Get text direction (RTL or LTR).
  static TextDirection getTextDirection(String text) {
    if (isPersianText(text)) return TextDirection.rtl;
    return TextDirection.ltr;
  }
}

enum TextDirection { rtl, ltr }
