import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/data/languages.dart';
import '../../../../core/widgets/language_picker.dart';
import '../../domain/entities/translation_job.dart';
import '../providers/translation_job_provider.dart';
import '../providers/ai_providers_provider.dart';

class TranslationScreen extends ConsumerStatefulWidget {
  const TranslationScreen({super.key});

  @override
  ConsumerState<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends ConsumerState<TranslationScreen> {
  String _sourceLanguage = 'auto';
  String _targetLanguage = 'fa';
  TranslationProfile _selectedProfile = TranslationProfile.balanced;
  String? _selectedProviderId;

  final _sourceTextController = TextEditingController();

  @override
  void dispose() {
    _sourceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final job = ref.watch(translationJobProvider);
    final activeProviders = ref.watch(activeProvidersProvider);

    final sourceLang = Languages.findByCode(_sourceLanguage);
    final targetLang = Languages.findByCode(_targetLanguage);
    final translatedText = job?.status == TranslationStatus.completed
        ? ref.read(translationJobProvider.notifier).getTranslatedText()
        : job?.status == TranslationStatus.inProgress
            ? job!.chunks
                .where((c) => c.isComplete)
                .map((c) => c.translatedText)
                .join('\n\n')
            : '';

    final isTranslating = job?.status == TranslationStatus.inProgress;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Show recent jobs
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
                      if (code != null) setState(() => _sourceLanguage = code);
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
                      if (code != null) setState(() => _targetLanguage = code);
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
                    .where((p) => p != TranslationProfile.custom || true)
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
          // Translated text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.outlineVariant),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Text(
                        translatedText.isEmpty
                            ? (isTranslating ? 'Translating...' : 'Translation will appear here...')
                            : translatedText,
                        style: TextStyle(
                          color: translatedText.isEmpty ? colorScheme.onSurfaceVariant : null,
                        ),
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
                    // Reset job state if not running
                    if (!isTranslating) {
                      // Allow user to start fresh
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

    ref.read(translationJobProvider.notifier).startTranslation(
      text: text,
      sourceLanguage: _sourceLanguage == 'auto' ? 'Auto Detect' : (Languages.findByCode(_sourceLanguage)?.name ?? _sourceLanguage),
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
              // Could reload job into view
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
