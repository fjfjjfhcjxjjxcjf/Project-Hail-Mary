import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/widgets/language_picker.dart';
import '../../../../core/data/languages.dart';
import '../../domain/entities/project.dart';
import '../providers/project_provider.dart';

const _uuid = Uuid();

class ProjectManagementScreen extends ConsumerWidget {
  const ProjectManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateDialog(context, ref),
          ),
        ],
      ),
      body: projects.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder_outlined, size: 64, color: colorScheme.outline),
                  const SizedBox(height: 16),
                  const Text('No projects yet'),
                  const SizedBox(height: 8),
                  Text(
                    'Create a project to organize your translations\nand maintain consistency across documents.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Create Project'),
                    onPressed: () => _showCreateDialog(context, ref),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                final entityCount = project.knownEntities.length;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(Icons.folder, color: colorScheme.onPrimaryContainer),
                    ),
                    title: Text(project.name),
                    subtitle: Text(
                      '${project.sourceLanguage} -> ${project.targetLanguage}'
                      '${entityCount > 0 ? "  *  $entityCount entities" : ""}',
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (ctx) => [
                        const PopupMenuItem(value: 'open', child: Text('Open')),
                        const PopupMenuItem(value: 'entities', child: Text('Entities')),
                        const PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                      onSelected: (v) {
                        if (v == 'open') {
                          ref.read(activeProjectProvider.notifier).state = project;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Active project: ${project.name}')),
                          );
                        } else if (v == 'entities') {
                          _showEntities(context, ref, project);
                        } else if (v == 'delete') {
                          _confirmDelete(context, ref, project);
                        }
                      },
                    ),
                    onTap: () {
                      ref.read(activeProjectProvider.notifier).state = project;
                      context.pop();
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    String srcLang = 'en';
    String tgtLang = 'fa';

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('New Project'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Project Name')),
                const SizedBox(height: 12),
                TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Description (optional)')),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Source Language'),
                  trailing: TextButton(
                    onPressed: () async {
                      final code = await showLanguagePicker(ctx, currentCode: srcLang, includeAutoDetect: false);
                      if (code != null) setState(() => srcLang = code);
                    },
                    child: Text(Languages.findByCode(srcLang)?.name ?? srcLang),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Target Language'),
                  trailing: TextButton(
                    onPressed: () async {
                      final code = await showLanguagePicker(ctx, currentCode: tgtLang, includeAutoDetect: false);
                      if (code != null) setState(() => tgtLang = code);
                    },
                    child: Text(Languages.findByCode(tgtLang)?.name ?? tgtLang),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty) return;
                ref.read(projectsProvider.notifier).create(
                  name: nameCtrl.text,
                  sourceLanguage: srcLang,
                  targetLanguage: tgtLang,
                  description: descCtrl.text,
                );
                Navigator.pop(ctx);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEntities(BuildContext context, WidgetRef ref, TranslationProject project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        expand: false,
        builder: (ctx, scrollCtrl) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(child: Text('Known Entities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addEntityDialog(context, ref, project),
                  ),
                ],
              ),
            ),
            Expanded(
              child: project.knownEntities.isEmpty
                  ? const Center(child: Text('No entities extracted yet'))
                  : ListView.builder(
                      controller: scrollCtrl,
                      itemCount: project.knownEntities.length,
                      itemBuilder: (ctx, i) {
                        final entity = project.knownEntities[i];
                        return ListTile(
                          leading: Icon(_iconForEntity(entity.type)),
                          title: Text(entity.name),
                          subtitle: Text(
                            '${entity.type.name}'
                            '${entity.translatedName.isNotEmpty ? ' -> ${entity.translatedName}' : ''}'
                            '${entity.occurrenceCount > 0 ? ' (${entity.occurrenceCount}x)' : ''}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, size: 18),
                            onPressed: () => _editEntityDialog(context, ref, project, entity),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _addEntityDialog(BuildContext context, WidgetRef ref, TranslationProject project) {
    final nameCtrl = TextEditingController();
    final transCtrl = TextEditingController();
    EntityType selectedType = EntityType.character;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Add Entity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Original Name')),
              const SizedBox(height: 12),
              TextField(controller: transCtrl, decoration: const InputDecoration(labelText: 'Translated Name')),
              const SizedBox(height: 12),
              DropdownButtonFormField<EntityType>(
                value: selectedType,
                items: EntityType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name))).toList(),
                onChanged: (v) => setState(() => selectedType = v ?? selectedType),
                decoration: const InputDecoration(labelText: 'Type'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                if (nameCtrl.text.isEmpty) return;
                ref.read(projectsProvider.notifier).addEntity(
                  project.id,
                  KnownEntity(
                    id: '',
                    name: nameCtrl.text,
                    type: selectedType,
                    translatedName: transCtrl.text,
                    createdAt: DateTime.now(),
                  ),
                );
                Navigator.pop(ctx);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _editEntityDialog(BuildContext context, WidgetRef ref, TranslationProject project, KnownEntity entity) {
    final transCtrl = TextEditingController(text: entity.translatedName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Edit: ${entity.name}'),
        content: TextField(controller: transCtrl, decoration: const InputDecoration(labelText: 'Translated Name')),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(projectsProvider.notifier).removeEntity(project.id, entity.id);
              Navigator.pop(ctx);
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
          FilledButton(
            onPressed: () {
              ref.read(projectsProvider.notifier).updateEntity(
                project.id,
                entity.copyWith(translatedName: transCtrl.text),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, TranslationProject project) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Project'),
        content: Text('Delete "${project.name}" and all its data?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(projectsProvider.notifier).remove(project.id);
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  IconData _iconForEntity(EntityType type) {
    switch (type) {
      case EntityType.character: return Icons.person;
      case EntityType.place: return Icons.place;
      case EntityType.organization: return Icons.business;
      case EntityType.skill: return Icons.auto_awesome;
      case EntityType.item: return Icons.inventory_2;
      case EntityType.magicSystem: return Icons.bolt;
      case EntityType.terminology: return Icons.menu_book;
      case EntityType.other: return Icons.label;
    }
  }
}
