import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/glossary.dart';
import '../providers/glossary_provider.dart';

const _uuid = Uuid();

class GlossaryManagementScreen extends ConsumerWidget {
  const GlossaryManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final glossaries = ref.watch(glossariesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Glossaries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateGlossaryDialog(context, ref),
          ),
        ],
      ),
      body: glossaries.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book_outlined, size: 64, color: colorScheme.outline),
                  const SizedBox(height: 16),
                  const Text('No glossaries yet'),
                  const SizedBox(height: 8),
                  Text(
                    'Create a glossary to ensure consistent\nterm translation across your documents.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Create Glossary'),
                    onPressed: () => _showCreateGlossaryDialog(context, ref),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: glossaries.length,
              itemBuilder: (context, index) {
                final glossary = glossaries[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Icon(Icons.book, color: colorScheme.primary),
                    title: Text(glossary.name),
                    subtitle: Text(
                      '${glossary.sourceLanguage} → ${glossary.targetLanguage}  •  ${glossary.entries.length} terms',
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (ctx) => [
                        const PopupMenuItem(value: 'edit', child: Text('Edit Terms')),
                        const PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                      onSelected: (v) {
                        if (v == 'edit') {
                          _showEditGlossaryScreen(context, ref, glossary);
                        } else if (v == 'delete') {
                          _confirmDelete(context, ref, glossary);
                        }
                      },
                    ),
                    onTap: () => _showEditGlossaryScreen(context, ref, glossary),
                  ),
                );
              },
            ),
    );
  }

  void _showCreateGlossaryDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final srcCtrl = TextEditingController(text: 'English');
    final tgtCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Glossary'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Glossary Name')),
            const SizedBox(height: 12),
            TextField(controller: srcCtrl, decoration: const InputDecoration(labelText: 'Source Language')),
            const SizedBox(height: 12),
            TextField(controller: tgtCtrl, decoration: const InputDecoration(labelText: 'Target Language')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty || tgtCtrl.text.isEmpty) return;
              ref.read(glossariesProvider.notifier).add(Glossary(
                id: '',
                name: nameCtrl.text,
                sourceLanguage: srcCtrl.text,
                targetLanguage: tgtCtrl.text,
                createdAt: DateTime.now(),
              ));
              Navigator.pop(ctx);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showEditGlossaryScreen(BuildContext context, WidgetRef ref, Glossary glossary) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => _GlossaryDetailScreen(glossaryId: glossary.id),
    ));
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Glossary glossary) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Glossary'),
        content: Text('Delete "${glossary.name}" and all its terms?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(glossariesProvider.notifier).remove(glossary.id);
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _GlossaryDetailScreen extends ConsumerStatefulWidget {
  final String glossaryId;
  const _GlossaryDetailScreen({required this.glossaryId});

  @override
  ConsumerState<_GlossaryDetailScreen> createState() => _GlossaryDetailScreenState();
}

class _GlossaryDetailScreenState extends ConsumerState<_GlossaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final glossaries = ref.watch(glossariesProvider);
    final glossary = glossaries.where((g) => g.id == widget.glossaryId).firstOrNull;

    if (glossary == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Glossary')),
        body: const Center(child: Text('Glossary not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(glossary.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addEntryDialog(glossary),
          ),
        ],
      ),
      body: glossary.entries.isEmpty
          ? const Center(child: Text('No terms yet. Tap + to add one.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: glossary.entries.length,
              itemBuilder: (context, index) {
                final entry = glossary.entries[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(entry.sourceTerm, style: const TextStyle(fontWeight: FontWeight.w500)),
                        ),
                        Icon(Icons.arrow_forward, size: 16, color: Theme.of(context).colorScheme.outline),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(entry.targetTerm, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        ),
                      ],
                    ),
                    subtitle: entry.context.isNotEmpty ? Text(entry.context) : null,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, size: 18),
                      onPressed: () {
                        ref.read(glossariesProvider.notifier).removeEntry(glossary.id, entry.id);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _addEntryDialog(Glossary glossary) {
    final srcCtrl = TextEditingController();
    final tgtCtrl = TextEditingController();
    final ctxCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Term'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: srcCtrl, decoration: InputDecoration(labelText: glossary.sourceLanguage)),
            const SizedBox(height: 12),
            TextField(controller: tgtCtrl, decoration: InputDecoration(labelText: glossary.targetLanguage)),
            const SizedBox(height: 12),
            TextField(controller: ctxCtrl, decoration: const InputDecoration(labelText: 'Context (optional)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              if (srcCtrl.text.isEmpty || tgtCtrl.text.isEmpty) return;
              ref.read(glossariesProvider.notifier).addEntry(
                glossary.id,
                GlossaryEntry(
                  id: '',
                  sourceTerm: srcCtrl.text,
                  targetTerm: tgtCtrl.text,
                  context: ctxCtrl.text,
                  createdAt: DateTime.now(),
                ),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
