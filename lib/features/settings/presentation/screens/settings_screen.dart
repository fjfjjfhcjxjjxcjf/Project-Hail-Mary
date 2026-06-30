import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/app_settings.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // AI Providers section
          _SectionHeader(title: 'AI Providers'),
          _SettingsTile(
            icon: Icons.smart_toy,
            title: 'Manage Providers',
            subtitle: 'Configure OpenAI, Gemini, Claude, and more',
            onTap: () => context.push('/providers'),
          ),
          _SettingsTile(
            icon: Icons.sort,
            title: 'Provider Priority',
            subtitle: 'Set fallback order for providers',
            onTap: () => _showPriorityDialog(context, ref),
          ),

          const Divider(indent: 16, endIndent: 16),

          // Translation section
          _SectionHeader(title: 'Translation'),
          _SettingsTile(
            icon: Icons.tune,
            title: 'Translation Profile',
            subtitle: settings.translationProfile[0].toUpperCase() +
                settings.translationProfile.substring(1),
            onTap: () => _showProfilePicker(context, ref),
          ),
          _SettingsTile(
            icon: Icons.text_fields,
            title: 'Chunk Size',
            subtitle: '${settings.chunkSize} characters',
            onTap: () => _showChunkSizeDialog(context, ref, settings.chunkSize),
          ),
          _SettingsTile(
            icon: Icons.thermostat,
            title: 'Temperature',
            subtitle: settings.temperature.toStringAsFixed(2),
            onTap: () => _showTemperatureDialog(context, ref, settings.temperature),
          ),
          _SettingsTile(
            icon: Icons.book,
            title: 'Glossary',
            subtitle: 'Manage translation glossaries',
            onTap: () => context.push('/glossaries'),
          ),
          _SettingsTile(
            icon: Icons.folder_special,
            title: 'Projects',
            subtitle: 'Manage translation projects & memory',
            onTap: () => context.push('/projects'),
          ),
          _SettingsTile(
            icon: Icons.edit_note,
            title: 'Prompt Templates',
            subtitle: 'Customize AI translation prompts',
            onTap: () => context.push('/prompt-editor'),
          ),

          const Divider(indent: 16, endIndent: 16),

          // Appearance section
          _SectionHeader(title: 'Appearance'),
          _SettingsTile(
            icon: Icons.palette,
            title: 'Theme',
            subtitle: settings.themeMode.name[0].toUpperCase() +
                settings.themeMode.name.substring(1),
            onTap: () => _showThemePicker(context, ref, settings.themeMode),
          ),

          const Divider(indent: 16, endIndent: 16),

          // Output section
          _SectionHeader(title: 'Output'),
          _SettingsTile(
            icon: Icons.file_download,
            title: 'Default Export Format',
            subtitle: settings.defaultExportFormat.toUpperCase(),
            onTap: () => _showExportFormatPicker(context, ref, settings.defaultExportFormat),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.save),
            title: const Text('Auto Save'),
            subtitle: const Text('Automatically save translation progress'),
            value: settings.autoSave,
            onChanged: (v) => settingsNotifier.toggleAutoSave(v),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Get notified when translations complete'),
            value: settings.notifications,
            onChanged: (v) => settingsNotifier.toggleNotifications(v),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.cloud_sync),
            title: const Text('Background Translation'),
            subtitle: const Text('Continue translating when app is in background'),
            value: settings.backgroundTranslation,
            onChanged: (v) => settingsNotifier.toggleBackgroundTranslation(v),
          ),

          const Divider(indent: 16, endIndent: 16),

          // About section
          _SectionHeader(title: 'About'),
          _SettingsTile(
            icon: Icons.info,
            title: 'DocLingo',
            subtitle: 'Version 2.0.0',
            onTap: () => _showAboutDialog(context),
          ),
          _SettingsTile(
            icon: Icons.restore,
            title: 'Reset Settings',
            subtitle: 'Restore all settings to defaults',
            onTap: () => _confirmReset(context, ref),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showThemePicker(BuildContext context, WidgetRef ref, AppThemeMode current) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppThemeMode.values.map((mode) {
            return RadioListTile<AppThemeMode>(
              title: Text(mode.name[0].toUpperCase() + mode.name.substring(1)),
              value: mode,
              groupValue: current,
              onChanged: (v) {
                if (v != null) ref.read(settingsProvider.notifier).updateTheme(v);
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showProfilePicker(BuildContext context, WidgetRef ref) {
    final profiles = ['literal', 'balanced', 'literary', 'academic', 'technical', 'children', 'poetry', 'novel', 'manga'];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Translation Profile'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: profiles.length,
            itemBuilder: (ctx, i) {
              final p = profiles[i];
              return ListTile(
                title: Text(p[0].toUpperCase() + p.substring(1)),
                onTap: () {
                  ref.read(settingsProvider.notifier).updateTranslationProfile(p);
                  Navigator.pop(ctx);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showChunkSizeDialog(BuildContext context, WidgetRef ref, int current) {
    final ctrl = TextEditingController(text: current.toString());
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Chunk Size'),
        content: TextField(
          controller: ctrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Characters per chunk', hintText: '2000'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final val = int.tryParse(ctrl.text);
              if (val != null && val > 100 && val < 50000) {
                ref.read(settingsProvider.notifier).updateChunkSize(val);
              }
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showTemperatureDialog(BuildContext context, WidgetRef ref, double current) {
    double temp = current;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Temperature'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(temp.toStringAsFixed(2), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Slider(
                value: temp,
                min: 0.0,
                max: 1.0,
                divisions: 20,
                onChanged: (v) => setDialogState(() => temp = v),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Precise', style: TextStyle(fontSize: 12, color: Theme.of(ctx).colorScheme.onSurfaceVariant)),
                  Text('Creative', style: TextStyle(fontSize: 12, color: Theme.of(ctx).colorScheme.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
            FilledButton(
              onPressed: () {
                ref.read(settingsProvider.notifier).updateTemperature(temp);
                Navigator.pop(ctx);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _showExportFormatPicker(BuildContext context, WidgetRef ref, String current) {
    final formats = ['pdf', 'epub', 'docx', 'txt', 'html'];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Default Export Format'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: formats.map((f) {
            return RadioListTile<String>(
              title: Text(f.toUpperCase()),
              value: f,
              groupValue: current,
              onChanged: (v) {
                if (v != null) ref.read(settingsProvider.notifier).updateDefaultExportFormat(v);
                Navigator.pop(ctx);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showPriorityDialog(BuildContext context, WidgetRef ref) {
    // Simple info dialog for now
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Provider Priority'),
        content: const Text(
          'When multiple providers are configured with API keys, '
          'DocLingo will try them in order. If the first provider fails, '
          'it falls back to the next one.\n\n'
          'Configure this by setting API keys for your preferred providers '
          'in the Manage Providers screen.',
        ),
        actions: [
          FilledButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'DocLingo',
      applicationVersion: '2.0.0',
      applicationLegalese: 'AI-powered document translator',
      children: [
        const SizedBox(height: 16),
        const Text(
          'Translate books, documents, and files into natural languages '
          'while preserving formatting. Supports multiple AI providers '
          'and translation profiles for different content types.',
        ),
      ],
    );
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset Settings'),
        content: const Text('Restore all settings to their default values?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              ref.read(settingsProvider.notifier).reset();
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings reset to defaults')),
              );
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
