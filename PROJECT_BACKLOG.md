# Project Hail Mary - Backlog

## Checkpoint: Pre GitHub Build (2026-06-28)
## Next Milestone: First Desktop / GitHub Actions Build Validation

---

## Completed

### v1.0.0 - Foundation (2026-06-27)
- [x] Flutter project setup with Riverpod, GoRouter, Hive, Freezed
- [x] Core layer: theme, constants, router, error handling, API client
- [x] Domain entities: AiProvider, TranslationJob, Glossary, AppSettings, Document
- [x] Data sources: TranslationDataSource (sync + streaming), ProviderDataSource
- [x] TranslationRepository with text chunking
- [x] UI shells: Home, Translation, DocumentPicker, Settings screens
- [x] Provider management (CRUD, API key storage)
- [x] Glossary management
- [x] LocalStorageService with Hive (5 boxes)
- [x] GoRouter navigation with bottom nav

### v2.0.0 - Core Intelligence (2026-06-27)
- [x] Enhanced Translation Profiles (11 built-in + custom)
- [x] Character Consistency Engine (entity extraction + translation memory)
- [x] AI Project Memory (project CRUD + knowledge persistence)
- [x] Smart Book Analysis (AI-powered pre-translation analysis)
- [x] Translation Modes architecture (Quick/Deep)
- [x] Smart Cache (content-hash caching)
- [x] Resume Translation (chunk-level resume)
- [x] Cost Optimizer (4 strategies + estimation)
- [x] Translation Comparison entity + provider
- [x] Prompt Editor (template CRUD + built-in templates)
- [x] Smart Content Detection (decorative filtering)
- [x] Layout Preservation (formatting in prompts)
- [x] Manga/Comic Mode (dedicated profile)
- [x] Persian Typography Engine (full correction pipeline + language guard)
- [x] Bilingual Export (text/HTML/Markdown, 4 formats)
- [x] Translation Quality Pipeline (AI review/consistency/score)
- [x] Plugin System architecture (manifest + manager + lifecycle)
- [x] Update System (version + migration-ready)
- [x] Documentation (10 files)
- [x] Extended LocalStorageService with 4 new Hive boxes (9 total)
- [x] Project management screen with entity CRUD
- [x] Prompt editor screen with template management
- [x] Book analysis screen with results display
- [x] Home screen with active project banner
- [x] Settings screen with all feature links

### v4.0.0 - Build Readiness (2026-06-28)
- [x] Fix critical type mismatch in TranslationDataSource
- [x] Fix PersianTypographyEngine language guard
- [x] Fix version mismatches (AppConstants, Settings)
- [x] Remove unused import in ExportService
- [x] Consolidate duplicate cost estimation logic
- [x] Add analysis_options.yaml
- [x] Add .gitignore
- [x] Create BUILD_READINESS.md
- [x] Create RELEASE_NOTES.md
- [x] Full dependency audit
- [x] Full Android configuration audit
- [x] CI preparation (GitHub Actions workflow)
- [x] Release signing template
- [x] Remove 5 unused dependencies (shared_preferences, flutter_animate, intl, string_similarity, gap)
- [x] Pre GitHub Build checkpoint

---

## Planned (Next)

### v4.1.0 - First Build Validation
1. Push project to GitHub repository
2. Run `flutter pub get` on desktop/CI
3. Run `dart run build_runner build` to generate ~28 files
4. Fix any build errors from generated code
5. Run `flutter analyze` and fix warnings
6. First successful `flutter run`
7. First successful `flutter build apk`
8. Validate CI workflow passes on GitHub Actions

### v2.1.0 - Image and Visual Translation
1. Vision API integration (GPT-4V / Gemini Vision)
2. Speech bubble detection in manga/comics
3. Text inpainting (background reconstruction)
4. Translated text overlay with style matching
5. OCR pipeline for scanned PDFs
6. Deep Mode orchestration (full pipeline)
7. Translation Comparison screen (side-by-side UI)

### v2.2.0 - Advanced Translation
1. Series Memory (multi-volume projects)
2. Universe Memory (cross-project entity sharing)
3. Global Consistency Checker (cross-chapter validation)
4. Hybrid Translation Workflow (multi-model pipeline)
5. Document Parser Integration (PDF, EPUB, DOCX text extraction)
6. Export to File (save translated docs to device storage)
7. Unit Tests for all services

---

## Future Versions

### v2.3.0 - Export and Publishing
- EPUB export with translated content
- PDF export with layout preservation
- DOCX export
- Print-ready output
- Custom export templates

### v3.0.0 - Platform and Ecosystem
- Plugin marketplace
- Community-shared glossaries
- Cloud sync for projects
- Collaborative translation
- Web version (Flutter web)
- Desktop version (Windows/Mac/Linux)

### Far Future
- Subtitle Translation (SRT/ASS format)
- Website Translation (URL-based)
- Voice Translation (speech-to-text)
- AI Model Fine-tuning (train on user preferences)
- Real-time collaboration
- Translation memory sharing
