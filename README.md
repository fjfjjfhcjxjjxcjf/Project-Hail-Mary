# Project Hail Mary -- DocLingo

AI-powered document translator built with Flutter. Translate books, documents, and files
into natural languages while preserving formatting, character consistency, and translation quality.

## Project Status

**Stable** | Ready for GitHub | Ready for CI | Ready for Desktop Flutter Validation

Application Version: **2.0.0+2**
Checkpoint: **Pre GitHub Build** (2026-06-28)
Next Milestone: First Desktop / GitHub Actions Build Validation

## Features

- **Multi-Provider Translation**: OpenAI, Gemini, Claude, DeepSeek, OpenRouter, Ollama, LM Studio, custom
- **11 Translation Profiles**: Novel, Philosophy, Academic, Manga, Comic, Technical, Children's Books, Business, Poetry, Literal, Balanced
- **Character Consistency Engine**: Extract characters, places, organizations, terminology; enforce consistent translations
- **AI Project Memory**: Persist knowledge across sessions and volumes
- **Smart Book Analysis**: Pre-translation analysis with cost/time estimation
- **Smart Cache**: Avoid re-translating identical text
- **Resume Translation**: Chunk-level progress tracking, resume on failure
- **Cost Optimizer**: Cheapest/fastest/quality/balanced provider selection
- **Translation Quality Pipeline**: AI review, consistency check, quality scoring
- **Prompt Editor**: Custom prompt templates with placeholders
- **Persian Typography Engine**: Half-spaces, digits, punctuation correction (auto-skips non-Persian text)
- **Bilingual Export**: Text/HTML/Markdown in 4 formats (original, translation, bilingual, side-by-side)
- **Plugin System**: Extensible architecture for providers, OCR, parsers, exporters
- **Smart Content Detection**: Filters decorative elements, watermarks, non-translatable content

## Project Statistics

| Metric | Value |
|--------|-------|
| Dart Source Files | 52 |
| Domain Entities (Freezed) | 14 files, ~25 classes |
| Services | 10 |
| Providers (Riverpod) | 7 |
| Screens | 11 |
| Hive Storage Boxes | 9 |
| Production Dependencies | 14 |
| Total Classes | ~89 |
| Documentation Files | 10 |

## Getting Started

```bash
cd doclingo
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

See [BUILD_READINESS.md](BUILD_READINESS.md) for detailed build instructions and readiness status.
See [RELEASE_NOTES.md](RELEASE_NOTES.md) for a complete summary of everything through Version 4.

## Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full architecture overview.

## Documentation

- [RELEASE_NOTES.md](RELEASE_NOTES.md) - Complete release summary
- [CHANGELOG.md](CHANGELOG.md) - Version history
- [ROADMAP.md](ROADMAP.md) - Future plans
- [TODO.md](TODO.md) - Immediate tasks
- [DEVELOPMENT_PROGRESS.md](DEVELOPMENT_PROGRESS.md) - Feature completion status
- [PROJECT_BACKLOG.md](PROJECT_BACKLOG.md) - Prioritized feature backlog
- [FEATURE_REQUESTS.md](FEATURE_REQUESTS.md) - Detailed feature specifications
- [BUILD_READINESS.md](BUILD_READINESS.md) - Build readiness report
- [ARCHITECTURE.md](ARCHITECTURE.md) - Architecture overview
