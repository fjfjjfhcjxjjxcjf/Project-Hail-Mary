# Project Hail Mary - Roadmap

## Checkpoint: Pre GitHub Build (2026-06-28)
## Status: Stable | Ready for GitHub | Ready for CI

---

## v1.0.0 - Foundation (2026-06-27) COMPLETE
- [x] Flutter project setup with Riverpod, GoRouter, Hive, Freezed
- [x] Core layer: theme, constants, router, error handling, API client
- [x] Domain entities: AiProvider, TranslationJob, Glossary, AppSettings, Document
- [x] Data sources: TranslationDataSource (sync + streaming), ProviderDataSource
- [x] TranslationRepository with text chunking
- [x] UI screens: Home, Translation, DocumentPicker, Settings
- [x] Provider management (CRUD, API key storage)
- [x] Glossary management
- [x] LocalStorageService with Hive (5 boxes)
- [x] GoRouter navigation with bottom nav

## v2.0.0 - Core Intelligence (2026-06-27) COMPLETE
- [x] Enhanced Translation Profiles (11 built-in + custom)
- [x] Character Consistency Engine
- [x] AI Project Memory
- [x] Smart Book Analysis
- [x] Smart Cache + Resume
- [x] Cost Optimizer
- [x] Quality Pipeline
- [x] Prompt Editor
- [x] Content Detection
- [x] Persian Typography
- [x] Bilingual Export
- [x] Plugin System

## v4.0.0 - Build Readiness (2026-06-28) COMPLETE
- [x] Fix critical bugs (type mismatch, PersianTypography guard)
- [x] Fix version mismatches across codebase
- [x] Add analysis_options.yaml
- [x] Add .gitignore
- [x] Consolidate duplicate code (cost estimation)
- [x] Create BUILD_READINESS.md
- [x] Dependency audit (removed 5 unused packages)
- [x] Android configuration audit
- [x] Code quality review
- [x] CI preparation (GitHub Actions workflow)
- [x] Release signing template
- [x] Checkpoint: Pre GitHub Build

## v4.1.0 - First Build Validation (NEXT MILESTONE)
- [ ] Push project to GitHub
- [ ] Run `flutter pub get` on desktop/CI
- [ ] Run `dart run build_runner build` to generate ~28 files
- [ ] Fix any build errors from generated code
- [ ] Run `flutter analyze` and fix warnings
- [ ] First successful `flutter run` on emulator/device
- [ ] First successful `flutter build apk`
- [ ] Validate CI workflow passes on GitHub Actions

## v2.1.0 - Image and Visual Translation (PLANNED)
- [ ] Vision API integration (GPT-4V, Gemini Vision)
- [ ] Speech bubble detection
- [ ] Text inpainting (background reconstruction)
- [ ] Translated text overlay with style matching
- [ ] Manga/Comic dedicated workflow
- [ ] OCR pipeline for scanned PDFs
- [ ] Translation comparison screen
- [ ] Deep Mode full orchestration

## v2.2.0 - Advanced Translation (PLANNED)
- [ ] Series memory (multi-volume projects)
- [ ] Universe memory (cross-project entity sharing)
- [ ] Global consistency checker
- [ ] Hybrid translation workflow
- [ ] Document parser integration (PDF, EPUB, DOCX)
- [ ] Export to file (save to device)

## v2.3.0 - Export and Publishing (PLANNED)
- [ ] EPUB export with translated content
- [ ] PDF export with layout preservation
- [ ] DOCX export
- [ ] Print-ready output
- [ ] Custom export templates

## v3.0.0 - Platform and Ecosystem (FUTURE)
- [ ] Plugin marketplace
- [ ] Community-shared glossaries
- [ ] Cloud sync for projects
- [ ] Collaborative translation
- [ ] Web version
- [ ] Desktop version (Windows/Mac/Linux)
