import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/languages.dart';
import '../../../../core/widgets/language_picker.dart';
import '../../../settings/presentation/providers/settings_provider.dart';
import '../../domain/entities/translation_job.dart';
import '../../domain/entities/ai_provider.dart';
import '../providers/translation_job_provider.dart';
import '../providers/ai_providers_provider.dart';

class TranslationScreen extends ConsumerStatefulWidget {
  const TranslationScreen({super.key});

  @override
  ConsumerState<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends ConsumerState<TranslationScreen> {
  late String _sourceLanguage;
  late String _targetLanguage;
  TranslationProfile _selectedProfile = TranslationProfile.balanced;
  String? _selectedProviderId;
  bool _initializedFromSettings = false;
  bool _loadingFile = false;
  String? _loadedFileName;

  final _sourceTextController = TextEditingController();

  @override
  void dispose() {
    _sourceTextController.dispose();
    super.dispose();
  }

  /// Initialize language selectors from persisted settings (once).
  void _initFromSettings() {
    if (_initializedFromSettings) return;
    final settings = ref.read(settingsProvider);
    _sourceLanguage = settings.sourceLanguage;
    _targetLanguage = settings.targetLanguage;
    _initializedFromSettings = true;
  }

  /// Persist current language selections.
  void _persistLanguages() {
    ref.read(settingsProvider.notifier).updateLanguages(
          _sourceLanguage,
          _targetLanguage,
        );
  }

  /// Handle incoming file from document picker (query params).
  void _handleIncomingFile() {
    final state = GoRouterState.of(context);
    final filePath = state.uri.queryParameters['file'];
    final fileName = state.uri.queryParameters['name'];
    if (filePath == null || filePath.isEmpty) return;
    if (_loadedFileName == fileName) return; // Already handled

    _loadedFileName = fileName;

    final ext = filePath.split('.').last.toLowerCase();
    final imageExtensions = ['png', 'jpg', 'jpeg', 'webp', 'bmp', 'tiff'];

    if (imageExtensions.contains(ext)) {
      _extractTextFromImage(filePath);
    } else {
      _readTextFile(filePath);
    }
  }

  /// Read a text-based file and populate the source text field.
  Future<void> _readTextFile(String path) async {
    setState(() => _loadingFile = true);
    try {
      final file = File(path);
      if (!await file.exists()) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File not found')),
          );
        }
        return;
      }
      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File is empty')),
          );
        }
        return;
      }
      _sourceTextController.text = content;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Loaded ${_loadedFileName ?? "file"} (${content.length} chars)')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error reading file: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingFile = false);
    }
  }

  /// Extract text from an image using the vision API.
  Future<void> _extractTextFromImage(String imagePath) async {
    setState(() => _loadingFile = true);
    try {
      final file = File(imagePath);
      if (!await file.exists()) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image file not found')),
          );
        }
        return;
      }

      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);

      // Find a vision-capable provider
      final activeProviders = ref.read(activeProvidersProvider);
      AiProvider? visionProvider;
      for (final p in activeProviders) {
        if (p.supportsVision) {
          visionProvider = p;
          break;
        }
      }
      visionProvider ??= activeProviders.isNotEmpty ? activeProviders.first : null;

      if (visionProvider == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No AI provider configured. Add an API key in Settings.')),
          );
        }
        return;
      }

      final repository = ref.read(translationRepositoryProvider);
      final extractedText = await repository.extractTextFromImage(
        base64Image: base64Image,
        provider: visionProvider,
      );

      if (extractedText.trim().isNotEmpty) {
        _sourceTextController.text = extractedText;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Extracted text from ${_loadedFileName ?? "image"}')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No text found in image')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image OCR failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _loadingFile = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initFromSettings();

    final colorScheme = Theme.of(context).colorScheme;
    final job = ref.watch(translationJobProvider);
    final activeProviders = ref.watch(activeProvidersProvider);

    // Handle incoming file from document picker (deferred to after first build)
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleIncomingFile());

    final sourceLang = Languages.findByCode(_sourceLanguage);
    final targetLang = Languages.findByCode(_targetLanguage);

    final isTranslating = job?.status == TranslationStatus.inProgress;
    final isFailed = job?.status == TranslationStatus.failed;

    final translatedText = job?.status == TranslationStatus.completed
        ? ref.read(translationJobProvider.notifier).getTranslatedText()
        : job?.status == TranslationStatus.inProgress
            ? job!.chunks
                .where((c) => c.isComplete)
                .map((c) => c.translatedText)
                .join('\n\n')
            : '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              final jobs = ref.read(pastJobsProvider);
              if (jobs.isNotEmpty) {
                _showRecentJobs(context, jobs);
              }
            },
          ),
          PopupMenuButton(
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: 'providers', child: Text('Manage Providers')),
              const PopupMenuItem(value: 'glossaries', child: Text('Glossaries')),
            ],
            onSelected: (v) {
              if (v == 'providers') context.push('/providers');
              if (v == 'glossaries') context.push('/glossaries');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Language selector bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: _LanguageChip(
                    language: sourceLang?.name ?? 'Auto Detect',
                    onTap: () async {
                      final code = await showLanguagePicker(
                        context,
                        currentCode: _sourceLanguage,
                        includeAutoDetect: true,
                      );
                      if (code != null) {
                        setState(() => _sourceLanguage = code);
                        _persistLanguages();
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: IconButton(
                    icon: const Icon(Icons.swap_horiz),
                    onPressed: _sourceLanguage == 'auto'
                        ? null
                        : () {
                            setState(() {
                              final temp = _sourceLanguage;
                              _sourceLanguage = _targetLanguage;
                              _targetLanguage = temp;
                            });
                            _persistLanguages();
                          },
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.primaryContainer,
                    ),
                  ),
                ),
                Expanded(
                  child: _LanguageChip(
                    language: targetLang?.name ?? 'Select',
                    onTap: () async {
                      final code = await showLanguagePicker(
                        context,
                        currentCode: _targetLanguage,
                        includeAutoDetect: false,
                      );
                      if (code != null) {
                        setState(() => _targetLanguage = code);
                        _persistLanguages();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          // Profile selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: TranslationProfile.values
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(p.displayName, style: const TextStyle(fontSize: 12)),
                            selected: _selectedProfile == p,
                            onSelected: (_) => setState(() => _selectedProfile = p),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          // Provider selector
          if (activeProviders.length > 1)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  Icon(Icons.smart_toy, size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      isDense: true,
                      value: _selectedProviderId ?? activeProviders.first.id,
                      underline: const SizedBox(),
                      items: activeProviders
                          .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name, style: const TextStyle(fontSize: 13))))
                          .toList(),
                      onChanged: (v) => setState(() => _selectedProviderId = v),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
          // Loading indicator for file import
          if (_loadingFile)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                  SizedBox(width: 8),
                  Text('Loading file...'),
                ],
              ),
            ),
          // Source text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _sourceTextController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Enter or paste text to translate...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Translated text / error display
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isFailed
                      ? colorScheme.errorContainer
                      : colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isFailed ? colorScheme.error : colorScheme.outlineVariant,
                  ),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: _buildResultContent(
                        translatedText: translatedText,
                        isTranslating: isTranslating,
                        isFailed: isFailed,
                        errorMessage: job?.errorMessage,
                        colorScheme: colorScheme,
                      ),
                    ),
                    if (isTranslating)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            value: job?.progress,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Action buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: isTranslating
                      ? FilledButton.icon(
                          onPressed: () {
                            ref.read(translationJobProvider.notifier).cancel();
                          },
                          icon: const Icon(Icons.stop),
                          label: const Text('Cancel'),
                          style: FilledButton.styleFrom(
                            backgroundColor: colorScheme.error,
                          ),
                        )
                      : FilledButton.icon(
                          onPressed: _translate,
                          icon: const Icon(Icons.translate),
                          label: const Text('Translate'),
                        ),
                ),
                const SizedBox(width: 12),
                IconButton.filledTonal(
                  icon: const Icon(Icons.copy),
                  tooltip: 'Copy translation',
                  onPressed: translatedText.isEmpty
                      ? null
                      : () {
                          Clipboard.setData(ClipboardData(text: translatedText));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied to clipboard')),
                          );
                        },
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Clear',
                  onPressed: () {
                    _sourceTextController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultContent({
    required String translatedText,
    required bool isTranslating,
    required bool isFailed,
    String? errorMessage,
    required ColorScheme colorScheme,
  }) {
    if (isFailed) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.error_outline, color: colorScheme.error, size: 18),
              const SizedBox(width: 8),
              Text(
                'Translation Failed',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onErrorContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage ?? 'An unknown error occurred',
            style: TextStyle(color: colorScheme.onErrorContainer),
          ),
        ],
      );
    }

    if (translatedText.isEmpty && isTranslating) {
      return Text(
        'Translating...',
        style: TextStyle(color: colorScheme.onSurfaceVariant),
      );
    }

    if (translatedText.isEmpty) {
      return Text(
        'Translation will appear here...',
        style: TextStyle(color: colorScheme.onSurfaceVariant),
      );
    }

    return Text(translatedText);
  }

  void _translate() {
    final text = _sourceTextController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter text to translate')),
      );
      return;
    }

    final activeProviders = ref.read(activeProvidersProvider);
    if (activeProviders.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('No AI provider configured'),
          action: SnackBarAction(
            label: 'Configure',
            onPressed: () => context.push('/providers'),
          ),
        ),
      );
      return;
    }

    // Validate that the selected provider has a model
    AiProvider? selectedProvider;
    if (_selectedProviderId != null) {
      selectedProvider = activeProviders.where((p) => p.id == _selectedProviderId).firstOrNull;
    }
    selectedProvider ??= activeProviders.first;

    if (selectedProvider.selectedModel.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${selectedProvider.name} has no model selected. Configure in Providers.'),
          action: SnackBarAction(
            label: 'Configure',
            onPressed: () => context.push('/providers'),
          ),
        ),
      );
      return;
    }

    _persistLanguages();

    ref.read(translationJobProvider.notifier).startTranslation(
          text: text,
          sourceLanguage: _sourceLanguage == 'auto'
              ? 'Auto Detect'
              : (Languages.findByCode(_sourceLanguage)?.name ?? _sourceLanguage),
          targetLanguage: Languages.findByCode(_targetLanguage)?.name ?? _targetLanguage,
          profile: _selectedProfile,
          providerId: _selectedProviderId,
          chunkSize: 2000,
        );
  }

  void _showRecentJobs(BuildContext context, List<TranslationJob> jobs) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jobs.length.clamp(0, 20),
        itemBuilder: (ctx, i) {
          final job = jobs[i];
          return ListTile(
            title: Text(job.documentName),
            subtitle: Text('${job.sourceLanguage} → ${job.targetLanguage}'),
            trailing: Text(job.status.name),
            onTap: () {
              Navigator.pop(ctx);
            },
          );
        },
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const _LanguageChip({required this.language, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  language,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
