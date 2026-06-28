import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/translation/presentation/screens/translation_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/document_picker/presentation/screens/document_picker_screen.dart';
import '../../features/translation/presentation/screens/provider_management_screen.dart';
import '../../features/translation/presentation/screens/glossary_management_screen.dart';
import '../../features/translation/presentation/screens/prompt_editor_screen.dart';
import '../../features/project/presentation/screens/project_management_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/translate', builder: (_, __) => const TranslationScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
          ]),
        ],
      ),
      GoRoute(
        path: '/pick-document',
        builder: (_, __) => const DocumentPickerScreen(),
      ),
      GoRoute(
        path: '/providers',
        builder: (_, __) => const ProviderManagementScreen(),
      ),
      GoRoute(
        path: '/glossaries',
        builder: (_, __) => const GlossaryManagementScreen(),
      ),
      GoRoute(
        path: '/projects',
        builder: (_, __) => const ProjectManagementScreen(),
      ),
      GoRoute(
        path: '/prompt-editor',
        builder: (_, state) {
          final templateId = state.uri.queryParameters['id'];
          return PromptEditorScreen(templateId: templateId);
        },
      ),
    ],
  );
}

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.translate_outlined), selectedIcon: Icon(Icons.translate), label: 'Translate'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
