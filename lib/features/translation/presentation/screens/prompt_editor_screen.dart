import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/prompt_template.dart';
import '../providers/prompt_templates_provider.dart';

class PromptEditorScreen extends ConsumerStatefulWidget {
  final String? templateId;
  const PromptEditorScreen({super.key, this.templateId});

  @override
  ConsumerState<PromptEditorScreen> createState() => _PromptEditorScreenState();
}

class _PromptEditorScreenState extends ConsumerState<PromptEditorScreen> {
  late TextEditingController _nameCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _systemCtrl;
  late TextEditingController _userCtrl;
  double _temperature = 0.3;
  String _category = 'Custom';
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _descCtrl = TextEditingController();
    _systemCtrl = TextEditingController();
    _userCtrl = TextEditingController();

    if (widget.templateId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final templates = ref.read(promptTemplatesProvider);
        final template = templates.where((t) => t.id == widget.templateId).firstOrNull;
        if (template != null) {
          setState(() {
            _isEditing = true;
            _nameCtrl.text = template.name;
            _descCtrl.text = template.description;
            _systemCtrl.text = template.systemPrompt;
            _userCtrl.text = template.userPromptTemplate;
            _temperature = template.temperature;
            _category = template.category;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    _systemCtrl.dispose();
    _userCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final templates = ref.watch(promptTemplatesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Prompt' : 'Prompt Templates'),
        actions: [
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveTemplate,
            ),
        ],
      ),
      body: _isEditing ? _buildEditor(colorScheme) : _buildList(templates, colorScheme),
    );
  }

  Widget _buildList(List<PromptTemplate> templates, ColorScheme colorScheme) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('New Template'),
            onPressed: () {
              setState(() {
                _isEditing = true;
                _nameCtrl.clear();
                _descCtrl.clear();
                _systemCtrl.clear();
                _userCtrl.clear();
              });
            },
            style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(
                    template.isBuiltIn ? Icons.lock : Icons.edit_note,
                    color: template.isBuiltIn ? colorScheme.outline : colorScheme.primary,
                  ),
                  title: Text(template.name),
                  subtitle: Text(template.description, maxLines: 1, overflow: TextOverflow.ellipsis),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(template.category, style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant)),
                      const SizedBox(width: 8),
                      if (!template.isBuiltIn)
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 18),
                          onPressed: () {
                            ref.read(promptTemplatesProvider.notifier).remove(template.id);
                          },
                        ),
                    ],
                  ),
                  onTap: () {
                    _nameCtrl.text = template.name;
                    _descCtrl.text = template.description;
                    _systemCtrl.text = template.systemPrompt;
                    _userCtrl.text = template.userPromptTemplate;
                    _temperature = template.temperature;
                    _category = template.category;
                    setState(() => _isEditing = true);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEditor(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameCtrl,
            decoration: const InputDecoration(labelText: 'Template Name'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descCtrl,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _category,
            items: ['Custom', 'Literature', 'Technical', 'Academic', 'Business', 'Other']
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (v) => setState(() => _category = v ?? 'Custom'),
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          const SizedBox(height: 16),
          const Text('System Prompt', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(
            'Instructions for the AI translator',
            style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _systemCtrl,
            maxLines: 10,
            decoration: const InputDecoration(
              hintText: 'You are a professional translator...',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          const Text('User Prompt Template', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(
            'Use {text}, {source}, {target}, {glossary} as placeholders',
            style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _userCtrl,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Translate from {source} to {target}:\n\n{text}',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Temperature:'),
              Expanded(
                child: Slider(
                  value: _temperature,
                  min: 0.0,
                  max: 1.0,
                  divisions: 20,
                  label: _temperature.toStringAsFixed(2),
                  onChanged: (v) => setState(() => _temperature = v),
                ),
              ),
              Text(_temperature.toStringAsFixed(2)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _isEditing = false),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: _saveTemplate,
                  child: const Text('Save Template'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _saveTemplate() {
    if (_nameCtrl.text.isEmpty || _systemCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name and system prompt are required')),
      );
      return;
    }

    final template = PromptTemplate(
      id: widget.templateId ?? '',
      name: _nameCtrl.text,
      description: _descCtrl.text,
      systemPrompt: _systemCtrl.text,
      userPromptTemplate: _userCtrl.text,
      temperature: _temperature,
      category: _category,
      createdAt: DateTime.now(),
    );

    if (widget.templateId != null) {
      ref.read(promptTemplatesProvider.notifier).update(template);
    } else {
      ref.read(promptTemplatesProvider.notifier).add(template);
    }

    setState(() => _isEditing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Template saved')),
    );
  }
}
