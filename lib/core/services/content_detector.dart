/// Smart Content Detection - filters decorative/non-translatable content.
class ContentDetector {
  ContentDetector._();

  static final _decorativePatterns = [
    RegExp(r'^[\s*~•●○■□▲△◇◆★☆✓✗✔✘✖]{3,}$'), // Decorative lines of symbols
    RegExp(r'^[─━═]{3,}$'), // Horizontal rules
    RegExp(r'^[│┃║]{3,}$'), // Vertical borders
    RegExp(r'^[┌┐└┘├┤┬┴┼─│═║╔╗╚╝╠╣╦╩╬]{3,}$'), // Box drawing
    RegExp(r'^(QR\s*Code|ISBN|ISSN)[:\s]', caseSensitive: false),
    RegExp(r'^https?://\S+$'), // Standalone URLs
    RegExp(r'^www\.\S+$'), // Standalone www links
    RegExp(r'^[\u{1F300}-\u{1F9FF}]+$', unicode: true), // Emoji-only lines
    RegExp(r'^[\s]*[-=*_]{3,}[\s]*$'), // Decorative separators
    RegExp(r'^\.{3,}$'), // Decorative dots
    RegExp(r'^[·•∙]{3,}$'), // Middle dot patterns
  ];

  static final _watermarkPatterns = [
    RegExp(r'(?:watermark|sample|draft|preview|copy\s*protected)', caseSensitive: false),
    RegExp(r'(?:do\s*not\s*copy|all\s*rights\s*reserved)', caseSensitive: false),
  ];

  /// Check if a line is decorative (should not be translated).
  static bool isDecorativeLine(String line) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) return false;
    for (final pattern in _decorativePatterns) {
      if (pattern.hasMatch(trimmed)) return true;
    }
    return false;
  }

  /// Check if text contains watermark content.
  static bool containsWatermark(String text) {
    for (final pattern in _watermarkPatterns) {
      if (pattern.hasMatch(text)) return true;
    }
    return false;
  }

  /// Check if a chunk is meaningful (should be translated).
  static bool isMeaningfulContent(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return false;
    // Must have at least some alphabetic characters
    final letterCount = RegExp(r'[a-zA-Z\u0600-\u06FF\u0400-\u04FF\u4E00-\u9FFF]')
        .allMatches(trimmed).length;
    return letterCount >= 3;
  }

  /// Filter a list of text chunks, marking which should be translated.
  static List<ContentChunk> classifyChunks(List<String> chunks) {
    return chunks.map((chunk) {
      final trimmed = chunk.trim();
      if (trimmed.isEmpty) {
        return ContentChunk(text: chunk, type: ChunkType.empty);
      }
      if (isDecorativeLine(trimmed)) {
        return ContentChunk(text: chunk, type: ChunkType.decorative);
      }
      if (containsWatermark(trimmed)) {
        return ContentChunk(text: chunk, type: ChunkType.watermark);
      }
      if (!isMeaningfulContent(trimmed)) {
        return ContentChunk(text: chunk, type: ChunkType.nonTranslatable);
      }
      return ContentChunk(text: chunk, type: ChunkType.translatable);
    }).toList();
  }
}

enum ChunkType { translatable, decorative, watermark, nonTranslatable, empty }

class ContentChunk {
  final String text;
  final ChunkType type;

  const ContentChunk({required this.text, required this.type});

  bool get shouldTranslate => type == ChunkType.translatable;
}
