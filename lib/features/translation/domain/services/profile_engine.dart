import '../entities/prompt_template.dart';
import '../entities/translation_job.dart';
import '../entities/glossary.dart';

/// Enhanced translation profile with full prompt engineering.
/// Extends the basic TranslationProfile enum with customizable behavior.
class TranslationProfileConfig {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String systemPrompt;
  final String userPromptPrefix;
  final String userPromptSuffix;
  final double defaultTemperature;
  final int defaultChunkSize;
  final bool preserveFormatting;
  final bool enforceGlossary;
  final bool useContextAwareness;
  final bool reviewTranslation;
  final String terminologyStrategy; // strict, relaxed, adaptive
  final Map<String, String> styleGuidelines;

  const TranslationProfileConfig({
    required this.id,
    required this.name,
    required this.description,
    this.icon = '📖',
    required this.systemPrompt,
    this.userPromptPrefix = '',
    this.userPromptSuffix = '',
    this.defaultTemperature = 0.3,
    this.defaultChunkSize = 2000,
    this.preserveFormatting = true,
    this.enforceGlossary = true,
    this.useContextAwareness = true,
    this.reviewTranslation = false,
    this.terminologyStrategy = 'adaptive',
    this.styleGuidelines = const {},
  });
}

class ProfileEngine {
  static final Map<String, TranslationProfileConfig> _builtInProfiles = {
    'novel': const TranslationProfileConfig(
      id: 'novel',
      name: 'Novel',
      description: 'Fiction and narrative prose',
      icon: '📚',
      systemPrompt: '''You are a professional literary translator specializing in novels and fiction.
Your translations must:
- Read as if originally written in the target language
- Preserve each character's unique voice, speech patterns, and personality
- Maintain narrative tension, pacing, and emotional impact
- Adapt cultural references naturally
- Keep dialogue natural and colloquial
- Preserve chapter structure, paragraph breaks, and formatting
- Never add translator notes or explanations
- Maintain consistency with the provided glossary and character names''',
      defaultTemperature: 0.4,
      defaultChunkSize: 3000,
      terminologyStrategy: 'strict',
      styleGuidelines: const {'tone': 'literary', 'register': 'mixed', 'dialogue': 'natural'},
    ),
    'philosophy': const TranslationProfileConfig(
      id: 'philosophy',
      name: 'Philosophy',
      description: 'Philosophical texts and essays',
      icon: '🧠',
      systemPrompt: '''You are a translator specializing in philosophical texts.
Your translations must:
- Preserve precise philosophical terminology
- Maintain the author's argumentative structure
- Keep technical terms consistent throughout
- Preserve citations and references exactly
- Use formal academic register
- Maintain the logical flow of arguments
- Preserve footnotes and endnotes
- Handle neologisms and coined terms carefully''',
      defaultTemperature: 0.2,
      defaultChunkSize: 2500,
      terminologyStrategy: 'strict',
    ),
    'academic': const TranslationProfileConfig(
      id: 'academic',
      name: 'Academic',
      description: 'Academic papers and research',
      icon: '🎓',
      systemPrompt: '''You are a translator specializing in academic and scholarly texts.
Your translations must:
- Maintain technical precision
- Preserve citations, references, and footnotes exactly
- Use formal academic register appropriate for the field
- Keep section numbering and structure intact
- Preserve tables, figures, and equations references
- Maintain consistent terminology throughout
- Handle abbreviations and acronyms properly''',
      defaultTemperature: 0.2,
      defaultChunkSize: 2000,
      terminologyStrategy: 'strict',
    ),
    'manga': const TranslationProfileConfig(
      id: 'manga',
      name: 'Manga',
      description: 'Manga and Japanese comics',
      icon: '📖',
      systemPrompt: '''You are a translator specializing in manga and Japanese comics.
Your translations must:
- Keep dialogue concise to fit speech bubbles
- Preserve honorifics where culturally relevant (san, kun, chan, sensei)
- Adapt Japanese onomatopoeia naturally
- Maintain character speech patterns (tsundere, kuudere, etc.)
- Preserve panel reading order markers
- Keep sound effects format consistent
- Make dialogue sound natural and character-appropriate
- Preserve manga-specific formatting markers''',
      defaultTemperature: 0.4,
      defaultChunkSize: 1000,
      terminologyStrategy: 'adaptive',
    ),
    'comic': const TranslationProfileConfig(
      id: 'comic',
      name: 'Comic',
      description: 'Western comics and graphic novels',
      icon: '💬',
      systemPrompt: '''You are a translator specializing in comics and graphic novels.
Your translations must:
- Keep dialogue concise for speech bubbles
- Preserve character voice and catchphrases
- Adapt slang and colloquialisms naturally
- Maintain action sound effects
- Preserve caption boxes and narration style
- Keep formatting markers intact''',
      defaultTemperature: 0.4,
      defaultChunkSize: 1000,
    ),
    'technical': const TranslationProfileConfig(
      id: 'technical',
      name: 'Technical',
      description: 'Technical documentation and manuals',
      icon: '⚙️',
      systemPrompt: '''You are a translator specializing in technical documentation.
Your translations must:
- Preserve all code blocks, URLs, and technical terms exactly
- Translate explanatory text naturally
- Maintain document structure (headings, lists, tables)
- Keep API names, function names, and variable names unchanged
- Preserve markdown/reStructuredText formatting
- Maintain consistent technical terminology''',
      defaultTemperature: 0.2,
      defaultChunkSize: 2000,
      terminologyStrategy: 'strict',
    ),
    'children': const TranslationProfileConfig(
      id: 'children',
      name: "Children's Books",
      description: 'Books for young readers',
      icon: '🧸',
      systemPrompt: '''You are a translator specializing in children's literature.
Your translations must:
- Use simple, clear language appropriate for the target age group
- Maintain the playful and engaging tone
- Preserve rhymes and wordplay where possible
- Keep the story fun and accessible
- Adapt cultural references for the target audience
- Preserve illustration references and formatting''',
      defaultTemperature: 0.5,
      defaultChunkSize: 1500,
    ),
    'business': const TranslationProfileConfig(
      id: 'business',
      name: 'Business',
      description: 'Business documents and correspondence',
      icon: '💼',
      systemPrompt: '''You are a translator specializing in business communication.
Your translations must:
- Use professional business register
- Preserve formal tone and structure
- Keep company names and brand terms unchanged
- Maintain document formatting (headers, bullet points, tables)
- Handle dates, currencies, and numbers according to target locale conventions
- Preserve legal terms precisely''',
      defaultTemperature: 0.2,
      defaultChunkSize: 2000,
      terminologyStrategy: 'strict',
    ),
    'poetry': const TranslationProfileConfig(
      id: 'poetry',
      name: 'Poetry',
      description: 'Poetry and verse',
      icon: '🖊',
      systemPrompt: '''You are a translator specializing in poetry.
Your translations must:
- Capture the spirit and emotion rather than literal meaning
- Preserve rhythm and meter where possible
- Maintain rhyme scheme or adapt it naturally
- Keep stanza structure and line breaks
- Preserve the poet's voice and style
- Use elevated literary language''',
      defaultTemperature: 0.6,
      defaultChunkSize: 500,
      preserveFormatting: true,
    ),
    'literal': const TranslationProfileConfig(
      id: 'literal',
      name: 'Literal',
      description: 'Word-for-word accuracy',
      icon: '📝',
      systemPrompt: '''Translate the following text with maximum accuracy, preserving the original meaning word-for-word where possible. Maintain all formatting, paragraph breaks, and structure exactly as the source. Do not paraphrase or adapt - translate precisely.''',
      defaultTemperature: 0.1,
      defaultChunkSize: 2000,
      terminologyStrategy: 'strict',
    ),
    'balanced': const TranslationProfileConfig(
      id: 'balanced',
      name: 'Balanced',
      description: 'Balance accuracy with readability',
      icon: '⚖️',
      systemPrompt: '''Translate the following text naturally while staying faithful to the original meaning. Balance accuracy with readability. Preserve formatting and structure.''',
      defaultTemperature: 0.3,
      defaultChunkSize: 2000,
      terminologyStrategy: 'adaptive',
    ),
    'literary': const TranslationProfileConfig(
      id: 'literary',
      name: 'Literary',
      description: 'High literary quality',
      icon: '✨',
      systemPrompt: '''Translate the following text with literary quality. Focus on beautiful, flowing prose that reads as if originally written in the target language. Preserve tone, style, and emotional impact. Maintain chapter and paragraph structure.''',
      defaultTemperature: 0.5,
      defaultChunkSize: 3000,
    ),
  };

  static final Map<String, TranslationProfileConfig> _customProfiles = {};

  /// Get all available profiles (built-in + custom).
  static List<TranslationProfileConfig> getAllProfiles() {
    return [..._builtInProfiles.values, ..._customProfiles.values];
  }

  /// Get a profile by ID.
  static TranslationProfileConfig? getProfile(String id) {
    return _builtInProfiles[id] ?? _customProfiles[id];
  }

  /// Register a custom profile.
  static void registerCustomProfile(TranslationProfileConfig profile) {
    _customProfiles[profile.id] = profile;
  }

  /// Remove a custom profile.
  static void removeCustomProfile(String id) {
    _customProfiles.remove(id);
  }

  /// Build the complete system prompt for a translation request.
  static String buildSystemPrompt({
    required String profileId,
    required String sourceLanguage,
    required String targetLanguage,
    String customPrompt = '',
    List<GlossaryEntry> glossary = const [],
    Map<String, String> entityNames = const {},
    String previousContext = '',
  }) {
    String basePrompt;
    if (profileId == 'custom' && customPrompt.isNotEmpty) {
      basePrompt = customPrompt;
    } else {
      final profile = getProfile(profileId);
      basePrompt = profile?.systemPrompt ?? _builtInProfiles['balanced']!.systemPrompt;
    }

    final buffer = StringBuffer(basePrompt);
    buffer.writeln('\n\n--- Translation Task ---');
    buffer.writeln('Source language: $sourceLanguage');
    buffer.writeln('Target language: $targetLanguage');
    buffer.writeln('Return ONLY the translated text. No explanations, no notes, no commentary.');

    // Entity names (character consistency)
    if (entityNames.isNotEmpty) {
      buffer.writeln('\n--- Character/Entity Names (MUST use these exact translations) ---');
      entityNames.forEach((original, translated) {
        buffer.writeln('  "$original" => "$translated"');
      });
    }

    // Glossary terms
    if (glossary.isNotEmpty) {
      buffer.writeln('\n--- Glossary (use these terms consistently) ---');
      for (final entry in glossary) {
        buffer.writeln('  "${entry.sourceTerm}" => "${entry.targetTerm}"');
        if (entry.context.isNotEmpty) {
          buffer.writeln('    Context: ${entry.context}');
        }
      }
    }

    // Previous context for continuity
    if (previousContext.isNotEmpty) {
      buffer.writeln('\n--- Previous translation context (for continuity) ---');
      buffer.writeln(previousContext);
    }

    return buffer.toString();
  }

  /// Get the translation profile enum from a profile ID.
  static TranslationProfile toEnumProfile(String profileId) {
    switch (profileId) {
      case 'literal': return TranslationProfile.literal;
      case 'balanced': return TranslationProfile.balanced;
      case 'literary': return TranslationProfile.literary;
      case 'academic': return TranslationProfile.academic;
      case 'technical': return TranslationProfile.technical;
      case 'children': return TranslationProfile.children;
      case 'poetry': return TranslationProfile.poetry;
      case 'novel': return TranslationProfile.novel;
      case 'manga': return TranslationProfile.manga;
      default: return TranslationProfile.custom;
    }
  }
}
