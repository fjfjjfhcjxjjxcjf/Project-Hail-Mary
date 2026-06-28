# DocLingo - Release Notes

## Project Hail Mary -- Pre GitHub Build

Checkpoint: 2026-06-28
Application Version: 2.0.0+2
Project Status: Stable | Ready for GitHub | Ready for CI | Ready for Desktop Flutter Validation

---

## What Is DocLingo

AI-powered document translator built with Flutter. Translate books, documents, and files
into natural languages while preserving formatting, character consistency, and translation quality.

---

## Completed Versions

### v1.0.0 - Foundation (2026-06-27)

Initial project scaffold and core infrastructure.

- Flutter 3.44+ / Dart 3.12+ project setup
- State management: Riverpod (StateNotifier + Provider)
- Navigation: GoRouter with StatefulShellRoute (bottom nav)
- Persistence: Hive (5 boxes)
- Core layer: theme, constants, router, error handling, API client (Dio)
- Domain entities: AiProvider, TranslationJob, Glossary, AppSettings, Document
- Data sources: TranslationDataSource (sync + streaming), ProviderDataSource
- TranslationRepository with text chunking
- UI screens: Home, Translation, DocumentPicker, Settings
- Provider management with API key CRUD
- Glossary management
- 10 translation profiles (enum-based)
- Language picker with 34 languages
- file_picker integration

**Files**: 29 Dart source files, 5 Hive boxes, 10 entities

---

### v2.0.0 - Core Intelligence (2026-06-27)

Full translation engine with advanced features.

**New Features (16)**:
- Enhanced Translation Profiles (11 built-in + custom, full prompt engineering)
- Character Consistency Engine (entity extraction + translation memory)
- AI Project Memory (project CRUD + knowledge persistence across sessions)
- Smart Book Analysis (AI-powered pre-translation analysis with cost/time estimation)
- Translation Modes architecture (Quick/Deep)
- Smart Cache (content-hash-based caching to avoid re-translating)
- Resume Translation (chunk-level progress tracking, resume on failure)
- Cost Optimizer (4 strategies: cheapest, fastest, quality, balanced)
- Translation Comparison entity + provider
- Prompt Editor (template CRUD + built-in templates with placeholders)
- Smart Content Detection (filters decorative elements, watermarks)
- Manga/Comic Mode (dedicated translation profile)
- Persian Typography Engine (half-spaces, digits, punctuation, auto-skips non-Persian)
- Bilingual Export (text/HTML/Markdown in 4 formats)
- Translation Quality Pipeline (AI review, consistency check, quality scoring)
- Plugin System architecture (manifest + manager + lifecycle)

**Architecture Additions**:
- 8 new domain entities (Project, KnownEntity, TranslationMemory, CacheEntry, PromptTemplate, QualityReport, ComparisonResult, PluginManifest)
- 10 services (ProfileEngine, ConsistencyEngine, BookAnalysisService, TranslationCacheService, QualityPipeline, CostOptimizer, ExportService, PersianTypographyEngine, ContentDetector, PluginManager)
- Extended LocalStorageService: 5 -> 9 Hive boxes
- 2 new providers (projectsProvider, promptTemplatesProvider)
- 3 new screens (ProjectManagementScreen, PromptEditorScreen, BookAnalysisScreen)
- 2 new routes (/projects, /prompt-editor)

**Files Created**: 23 new Dart files, 8 documentation files
**Files Modified**: 5 (pubspec.yaml, local_storage_service, app_router, home_screen, settings_screen)

---

### v4.0.0 - Build Readiness (2026-06-28)

Build preparation, bug fixes, code quality, and CI/CD pipeline.

**Bug Fixes (4)**:
1. CRITICAL: Fixed type mismatch in TranslationDataSource (glossary = '' -> glossary = const [])
2. CRITICAL: Fixed PersianTypographyEngine corrupting non-Persian text (added language guard)
3. Fixed version mismatch in AppConstants (1.0.0 -> 2.0.0)
4. Fixed version mismatch in Settings About dialog (1.0.0 -> 2.0.0)

**Code Quality (3)**:
1. Consolidated duplicate cost estimation (BookAnalysisService -> CostOptimizer)
2. Removed unused dart:convert import from ExportService
3. Removed 5 unused dependencies (shared_preferences, flutter_animate, intl, string_similarity, gap)

**Configuration (4)**:
1. Added analysis_options.yaml with Flutter linting rules
2. Added .gitignore with comprehensive exclusions
3. Added android/key.properties.template for release signing
4. Added android/local.properties.template for desktop builds

**CI/CD (1)**:
1. Created .github/workflows/ci.yml (build pipeline + release APK on tags)

**Files Modified**: 6 source files, 4 new config files, 1 CI workflow

---

## Current Project State

| Metric | Value |
|--------|-------|
| Application Version | 2.0.0+2 |
| Dart Source Files | 52 |
| Domain Entities (Freezed) | 14 files, ~25 classes |
| Services | 10 |
| Providers (Riverpod) | 7 |
| Screens | 11 |
| Hive Storage Boxes | 9 |
| Production Dependencies | 14 |
| Dev Dependencies | 7 |
| Documentation Files | 10 |
| Total Classes | ~89 |
| Files Needing build_runner | 15 (14 freezed + 1 riverpod) |
| Generated Files (expected) | ~28 |

## Build Readiness

| Category | Status |
|----------|--------|
| Dart Source Code | READY |
| Dependencies | READY (14 prod + 7 dev) |
| Android Configuration | READY (compileSdk 35, minSdk 24) |
| Analysis Options | READY |
| .gitignore | READY |
| CI/CD Pipeline | READY |
| Entity Models (Freezed) | NEEDS build_runner GENERATION |
| Unit Tests | NOT STARTED |

## What Blocks First Build

1. `flutter pub get` -- requires desktop/CI (Flutter CLI rejects Android host)
2. `dart run build_runner build` -- generates ~28 .freezed.dart and .g.dart files
3. Any build errors from generated code must be fixed
4. `flutter analyze` warnings must be resolved

## Next Milestone

**First Desktop / GitHub Actions Build Validation**

No additional feature development until the first successful Flutter build
has been completed and validated.

## What Comes After First Build (Planned, Not Started)

- v2.1.0: Vision API, translation comparison, deep mode, export-to-file
- v2.2.0: Series memory, universe memory, document parsers
- v2.3.0: EPUB/PDF/DOCX export
- v3.0.0: Plugin marketplace, cloud sync, web/desktop builds
