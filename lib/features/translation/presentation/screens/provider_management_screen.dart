import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/ai_provider.dart';
import '../../data/sources/provider_data_source.dart';
import '../providers/ai_providers_provider.dart';

class ProviderManagementScreen extends ConsumerWidget {
  const ProviderManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = ref.watch(providersProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Providers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddProviderSheet(context, ref),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          final hasKey = provider.apiKey.isNotEmpty;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _iconForType(provider.type),
                        color: hasKey ? colorScheme.primary : colorScheme.outline,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider.name,
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              provider.type.name.toUpperCase(),
                              style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      // Status indicator
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: hasKey
                              ? colorScheme.primaryContainer
                              : colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          hasKey ? 'Active' : 'No API Key',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: hasKey
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Model selector
                  if (provider.models.isNotEmpty) ...[
                    Text('Model', style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 4),
                    DropdownButtonFormField<String>(
                      value: provider.selectedModel.isNotEmpty ? provider.selectedModel : null,
                      items: provider.models
                          .map((m) => DropdownMenuItem(value: m, child: Text(m, style: const TextStyle(fontSize: 13))))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) {
                          ref.read(providersProvider.notifier).setSelectedModel(provider.id, v);
                        }
                      },
                      decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                    ),
                    const SizedBox(height: 12),
                  ],
                  // API Key field
                  Text('API Key', style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 4),
                  _ApiKeyField(
                    initialValue: provider.apiKey,
                    providerType: provider.type,
                    onChanged: (key) {
                      ref.read(providersProvider.notifier).setApiKey(provider.id, key);
                    },
                  ),
                  const SizedBox(height: 12),
                  // Actions
                  Row(
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.vpn_key, size: 16),
                        label: const Text('Test Key'),
                        onPressed: hasKey ? () => _testApiKey(context, ref, provider) : null,
                      ),
                      const Spacer(),
                      if (provider.type == ProviderType.custom)
                        TextButton.icon(
                          icon: const Icon(Icons.delete_outline, size: 16),
                          label: const Text('Remove'),
                          style: TextButton.styleFrom(foregroundColor: colorScheme.error),
                          onPressed: () => _confirmDelete(context, ref, provider),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _iconForType(ProviderType type) {
    switch (type) {
      case ProviderType.openai:
        return Icons.auto_awesome;
      case ProviderType.gemini:
        return Icons.diamond;
      case ProviderType.openrouter:
        return Icons.hub;
      case ProviderType.deepseek:
        return Icons.psychology;
      case ProviderType.claude:
        return Icons.smart_toy;
      case ProviderType.ollama:
      case ProviderType.lmStudio:
        return Icons.computer;
      case ProviderType.custom:
        return Icons.extension;
    }
  }

  void _testApiKey(BuildContext context, WidgetRef ref, AiProvider provider) async {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(content: Text('Testing ${provider.name}...')));

    final dataSource = ProviderDataSourceImpl();
    final valid = await dataSource.validateApiKey(provider);

    scaffold.clearSnackBars();
    scaffold.showSnackBar(SnackBar(
      content: Text(valid ? '${provider.name} is working!' : '${provider.name} key is invalid'),
      backgroundColor: valid ? Colors.green : Colors.red,
    ));
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, AiProvider provider) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Provider'),
        content: Text('Remove ${provider.name}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(providersProvider.notifier).remove(provider.id);
              Navigator.pop(ctx);
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _showAddProviderSheet(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final urlCtrl = TextEditingController();
    final keyCtrl = TextEditingController();
    final modelCtrl = TextEditingController();
    ProviderType selectedType = ProviderType.custom;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheetState) => Padding(
          padding: EdgeInsets.fromLTRB(
            24, 24, 24, MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add Custom Provider', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Provider Name'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<ProviderType>(
                value: selectedType,
                items: ProviderType.values
                    .map((t) => DropdownMenuItem(value: t, child: Text(t.name)))
                    .toList(),
                onChanged: (v) => setSheetState(() => selectedType = v ?? selectedType),
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: urlCtrl,
                decoration: const InputDecoration(labelText: 'Base URL', hintText: 'https://api.example.com/v1'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: keyCtrl,
                decoration: const InputDecoration(labelText: 'API Key'),
                obscureText: true,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: modelCtrl,
                decoration: const InputDecoration(labelText: 'Model ID', hintText: 'gpt-4o-mini'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (nameCtrl.text.isEmpty || urlCtrl.text.isEmpty) return;
                    final newProvider = AiProvider(
                      id: '',
                      name: nameCtrl.text,
                      type: selectedType,
                      baseUrl: urlCtrl.text,
                      models: modelCtrl.text.isNotEmpty ? [modelCtrl.text] : [],
                      selectedModel: modelCtrl.text,
                    );
                    // Apply credential via JSON round-trip
                    final json = newProvider.toJson();
                    json['apiKey'] = keyCtrl.text;
                    ref.read(providersProvider.notifier).add(AiProvider.fromJson(json));
                    Navigator.pop(ctx);
                  },
                  child: const Text('Add Provider'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ApiKeyField extends StatefulWidget {
  final String initialValue;
  final ProviderType providerType;
  final ValueChanged<String> onChanged;

  const _ApiKeyField({
    required this.initialValue,
    required this.providerType,
    required this.onChanged,
  });

  @override
  State<_ApiKeyField> createState() => _ApiKeyFieldState();
}

class _ApiKeyFieldState extends State<_ApiKeyField> {
  late final TextEditingController _ctrl;
  bool _obscured = true;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _ctrl,
      obscureText: _obscured,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintText: _hintForType(widget.providerType),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(_obscured ? Icons.visibility_off : Icons.visibility, size: 18),
              onPressed: () => setState(() => _obscured = !_obscured),
            ),
            IconButton(
              icon: const Icon(Icons.check, size: 18),
              onPressed: () => widget.onChanged(_ctrl.text),
            ),
          ],
        ),
      ),
      onSubmitted: (v) => widget.onChanged(v),
    );
  }

  String _hintForType(ProviderType type) {
    switch (type) {
      case ProviderType.openai:
        return 'sk-...';
      case ProviderType.claude:
        return 'sk-ant-...';
      case ProviderType.gemini:
        return 'AIza...';
      default:
        return 'Enter API key';
    }
  }
}
