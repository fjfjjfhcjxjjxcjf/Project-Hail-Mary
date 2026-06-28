import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../translation/presentation/providers/translation_job_provider.dart';
import '../../../translation/domain/entities/translation_job.dart';
import '../../../project/presentation/providers/project_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final pastJobs = ref.watch(pastJobsProvider);
    final activeProject = ref.watch(activeProjectProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.translate, size: 32, color: colorScheme.primary),
                        const SizedBox(width: 12),
                        Text('DocLingo', style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'AI-powered document translator',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Active project banner
            if (activeProject != null)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                  child: Card(
                    color: colorScheme.primaryContainer,
                    child: ListTile(
                      leading: Icon(Icons.folder_special, color: colorScheme.onPrimaryContainer),
                      title: Text(
                        activeProject.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      subtitle: Text(
                        '${activeProject.sourceLanguage} -> ${activeProject.targetLanguage}'
                        '${activeProject.knownEntities.isNotEmpty ? "  *  ${activeProject.knownEntities.length} entities" : ""}',
                        style: TextStyle(color: colorScheme.onPrimaryContainer, fontSize: 12),
                      ),
                      trailing: Icon(Icons.chevron_right, color: colorScheme.onPrimaryContainer),
                      onTap: () => context.push('/projects'),
                    ),
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: _QuickActions(colorScheme: colorScheme),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Recent Translations', style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            if (pastJobs.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: _EmptyState(),
                ),
              )
            else
              SliverList.builder(
                itemCount: pastJobs.length > 10 ? 10 : pastJobs.length,
                itemBuilder: (context, index) {
                  final job = pastJobs[index];
                  return _JobCard(job: job);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  final ColorScheme colorScheme;
  const _QuickActions({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            icon: Icons.file_open,
            label: 'Open File',
            subtitle: 'Pick a document',
            color: colorScheme.primaryContainer,
            onTap: () => context.push('/pick-document'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionCard(
            icon: Icons.edit_note,
            label: 'Text',
            subtitle: 'Translate text',
            color: colorScheme.secondaryContainer,
            onTap: () {
              // Navigate to translate tab
              final shell = StatefulNavigationShell.of(context);
              shell.goBranch(1);
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionCard(
            icon: Icons.folder_special,
            label: 'Projects',
            subtitle: 'Manage projects',
            color: colorScheme.tertiaryContainer,
            onTap: () => context.push('/projects'),
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              Text(subtitle, style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final TranslationJob job;
  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final statusColor = switch (job.status) {
      TranslationStatus.completed => Colors.green,
      TranslationStatus.inProgress => colorScheme.primary,
      TranslationStatus.failed => colorScheme.error,
      TranslationStatus.cancelled => colorScheme.outline,
      _ => colorScheme.onSurfaceVariant,
    };
    final statusIcon = switch (job.status) {
      TranslationStatus.completed => Icons.check_circle,
      TranslationStatus.inProgress => Icons.hourglass_top,
      TranslationStatus.failed => Icons.error_outline,
      TranslationStatus.cancelled => Icons.cancel_outlined,
      _ => Icons.schedule,
    };

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: ListTile(
        leading: Icon(statusIcon, color: statusColor),
        title: Text(job.documentName, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${job.sourceLanguage} → ${job.targetLanguage}  •  ${job.profile.displayName}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: job.status == TranslationStatus.inProgress
            ? SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(value: job.progress, strokeWidth: 3),
              )
            : Text(
                '${(job.progress * 100).toInt()}%',
                style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 32),
          Icon(Icons.description_outlined, size: 64, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text('No translations yet', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Open a document or paste text to start translating',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
