import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/services/book_analysis_service.dart';
import '../../../translation/presentation/providers/ai_providers_provider.dart';

class BookAnalysisScreen extends ConsumerStatefulWidget {
  final String documentId;
  final String text;

  const BookAnalysisScreen({
    super.key,
    required this.documentId,
    required this.text,
  });

  @override
  ConsumerState<BookAnalysisScreen> createState() => _BookAnalysisScreenState();
}

class _BookAnalysisScreenState extends ConsumerState<BookAnalysisScreen> {
  AnalysisResult? _result;
  bool _isAnalyzing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _analyze();
  }

  Future<void> _analyze() async {
    final activeProviders = ref.read(activeProvidersProvider);
    if (activeProviders.isEmpty) {
      setState(() => _error = 'No AI provider configured. Add an API key in Settings.');
      return;
    }

    setState(() {
      _isAnalyzing = true;
      _error = null;
    });

    try {
      final service = BookAnalysisService();
      final result = await service.analyzeText(
        text: widget.text,
        sourceLanguage: 'Auto',
        provider: activeProviders.first,
      );
      setState(() {
        _result = result;
        _isAnalyzing = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Analysis failed: $e';
        _isAnalyzing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Book Analysis')),
      body: _isAnalyzing
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Analyzing document...'),
                  SizedBox(height: 8),
                  Text('Extracting characters, terms, and structure',
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            )
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: colorScheme.error),
                      const SizedBox(height: 16),
                      Text(_error!),
                      const SizedBox(height: 16),
                      FilledButton(onPressed: _analyze, child: const Text('Retry')),
                    ],
                  ),
                )
              : _result != null
                  ? _buildResults(colorScheme)
                  : const SizedBox(),
    );
  }

  Widget _buildResults(ColorScheme colorScheme) {
    final r = _result!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.analytics, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      const Text('Document Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _statRow('Words', '${r.wordCount}'),
                  _statRow('Paragraphs', '${r.paragraphCount}'),
                  _statRow('Detected Language', r.detectedLanguage),
                  _statRow('Estimated Tokens', '${r.estimatedTokens}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Summary text
          if (r.summary.isNotEmpty) ...[
            Text('Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.primary)),
            const SizedBox(height: 8),
            Text(r.summary),
            const SizedBox(height: 16),
          ],

          // Characters
          if (r.characters.isNotEmpty) ...[
            Text('Characters & Entities (${r.characters.length})',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.primary)),
            const SizedBox(height: 8),
            ...r.characters.map((c) => Card(
              margin: const EdgeInsets.only(bottom: 4),
              child: ListTile(
                dense: true,
                leading: Icon(_iconForType(c.type), size: 20),
                title: Text(c.name),
                subtitle: Text('${c.type}  *  ${c.occurrences} occurrences'
                    '${c.aliases.isNotEmpty ? '  *  Aliases: ${c.aliases.join(", ")}' : ''}'),
              ),
            )),
            const SizedBox(height: 16),
          ],

          // Terms
          if (r.terms.isNotEmpty) ...[
            Text('Terminology (${r.terms.length})',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.primary)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: r.terms.map((t) => Chip(
                label: Text('${t.term} (${t.occurrences}x)', style: const TextStyle(fontSize: 12)),
                visualDensity: VisualDensity.compact,
              )).toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Approve button
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Approve & Start Translation'),
              onPressed: () {
                Navigator.pop(context, _result);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'character': return Icons.person;
      case 'place': return Icons.place;
      case 'organization': return Icons.business;
      case 'skill': return Icons.auto_awesome;
      case 'item': return Icons.inventory_2;
      case 'magic_system': return Icons.bolt;
      case 'terminology': return Icons.menu_book;
      default: return Icons.label;
    }
  }
}
