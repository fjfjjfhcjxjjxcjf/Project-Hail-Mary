# Project Hail Mary - Changelog

## v4.0.0 (2026-06-28) - Build Readiness [COMPLETE]

### Bug Fixes
- Fixed critical type mismatch in `TranslationDataSource` abstract class (`glossary = ''` -> `glossary = const []`)
- Fixed `PersianTypographyEngine` corrupting non-Persian text (added language guard to `correct()`)
- Fixed version mismatch in `AppConstants.appVersion` (1.0.0 -> 2.0.0)
- Fixed version mismatch in Settings About dialog (1.0.0 -> 2.0.0)

### Code Quality
- Consolidated duplicate cost estimation logic: `BookAnalysisService.estimateCost()` now delegates to `CostOptimizer`
- Removed unused `dart:convert` import from `ExportService`
- Removed 5 unused dependencies from pubspec.yaml (shared_preferences, flutter_animate, intl, string_similarity, gap)

### Configuration
- Added `analysis_options.yaml` with Flutter linting rules (excludes generated files)
- Added `.gitignore` with comprehensive Flutter/Android/iOS exclusions
- Added `android/local.properties.template` for desktop build reference
- Added `android/key.properties.template` for release signing setup

### CI/CD
- Created `.github/workflows/ci.yml` with full build pipeline
- CI runs: pub get -> build_runner -> analyze -> test -> build apk
- Release workflow builds APK on version tags

### Documentation
- Created `BUILD_READINESS.md` with full build readiness report
- Created `RELEASE_NOTES.md` with complete release summary
- Updated `README.md` with checkpoint status and documentation links
- Updated all 10 documentation files to reflect final v4.0.0 status

### Checkpoint: Pre GitHub Build
- All 10 build readiness phases complete
- All code changes saved and verified
- Project marked Stable, Ready for GitHub, Ready for CI
- Next milestone: First Desktop / GitHub Actions Build Validation

---

## v2.0.0 (2026-06-27) - Core Intelligence

### New Features
- Enhanced Translation Profiles (11 built-in + custom)
- Character Consistency Engine (entity extraction + translation memory)
- AI Project Memory (project CRUD + knowledge persistence)
- Smart Book Analysis (AI-powered pre-translation analysis)
- Translation Modes architecture (Quick/Deep)
- Smart Cache (content-hash caching)
- Resume Translation (chunk-level resume)
- Cost Optimizer (4 strategies + estimation)
- Translation Comparison entity + provider
- Prompt Editor (template CRUD + built-in templates)
- Smart Content Detection (decorative filtering)
- Manga/Comic Mode (dedicated profile)
- Persian Typography Engine (full correction pipeline)
- Bilingual Export (text/HTML/Markdown, 4 formats)
- Translation Quality Pipeline (AI review/consistency/score)
- Plugin System architecture (manifest + manager + lifecycle)

### Architecture Changes
- Added 8 domain entities (Project, KnownEntity, TranslationMemory, CacheEntry, PromptTemplate, QualityReport, ComparisonResult, PluginManifest)
- Added 10 services (ProfileEngine, ConsistencyEngine, BookAnalysisService, TranslationCacheService, QualityPipeline, CostOptimizer, ExportService, PersianTypographyEngine, ContentDetector, PluginManager)
- Extended LocalStorageService with 4 new Hive boxes (9 total)
- Added 2 providers (projectsProvider, promptTemplatesProvider)
- Added 3 screens (ProjectManagementScreen, PromptEditorScreen, BookAnalysisScreen)
- Updated router with 2 new routes (/projects, /prompt-editor)
- Updated home screen with active project banner
- Updated settings screen with Projects and Prompt Templates links

### Files Created (23 new Dart files + 8 documentation files)
- 8 domain entities
- 10 services
- 2 providers
- 3 screens
- 1 plugin manager
- README, CHANGELOG, ROADMAP, TODO, ARCHITECTURE, DEVELOPMENT_PROGRESS, PROJECT_BACKLOG, FEATURE_REQUESTS

### Files Modified (5)
- pubspec.yaml (crypto dependency, version bump to 2.0.0)
- local_storage_service.dart (4 new Hive boxes)
- app_router.dart (2 new routes)
- home_screen.dart (project banner + Projects quick action)
- settings_screen.dart (Projects + Prompt Templates tiles)

---

## v1.0.0 (2026-06-27) - Foundation

### Features
- Flutter project setup with Riverpod, GoRouter, Hive, Freezed
- Core layer: theme, constants, router, error handling, API client
- Domain entities: AiProvider, TranslationJob, Glossary, AppSettings, Document
- Data sources: TranslationDataSource (sync + streaming), ProviderDataSource
- TranslationRepository with text chunking
- UI: Home, Translation, DocumentPicker, Settings screens
- Provider management (CRUD, API key storage)
- Glossary management
- LocalStorageService with Hive (5 boxes)
- GoRouter navigation with bottom nav
- 10 translation profiles (enum-based)
- Language picker with 34 languages
- file_picker integration
