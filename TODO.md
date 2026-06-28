# Project Hail Mary - TODO

## Checkpoint: Pre GitHub Build (2026-06-28)
## Version 4 Status: COMPLETE
## Project Status: Stable | Ready for GitHub | Ready for CI

---

## v4.0.0 Completed (Build Readiness)
- [x] Fix critical type mismatch in TranslationDataSource
- [x] Fix PersianTypographyEngine language guard
- [x] Fix version mismatches (AppConstants, Settings)
- [x] Remove unused import in ExportService
- [x] Consolidate duplicate cost estimation logic
- [x] Add analysis_options.yaml
- [x] Add .gitignore
- [x] Create BUILD_READINESS.md
- [x] Full dependency audit
- [x] Full Android configuration audit
- [x] CI preparation (GitHub Actions workflow)
- [x] Release signing template
- [x] Remove 5 unused dependencies from pubspec.yaml
- [x] Update all documentation files
- [x] Create RELEASE_NOTES.md
- [x] Pre GitHub Build checkpoint

---

## Next Milestone: First Desktop / GitHub Actions Build Validation

No additional feature development until the first successful Flutter build
has been completed and validated.

### Immediate (v4.1.0)
- [ ] Push project to GitHub repository
- [ ] Run `flutter pub get` on desktop/CI environment
- [ ] Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] Fix any build errors from generated code
- [ ] Run `flutter analyze` and fix warnings
- [ ] Verify all 14 entity files generated correctly
- [ ] Verify app_router.g.dart generated correctly
- [ ] Test basic app launch on emulator
- [ ] First successful `flutter run`
- [ ] First successful `flutter build apk`
- [ ] Validate CI workflow passes on GitHub Actions

### Post-Build Cleanup
- [ ] Add app icon (currently using default Flutter icon)
- [ ] Add splash screen configuration

### Testing (Post-Build)
- [ ] Unit tests for ProfileEngine
- [ ] Unit tests for ConsistencyEngine
- [ ] Unit tests for ContentDetector
- [ ] Unit tests for PersianTypographyEngine
- [ ] Unit tests for CostOptimizer
- [ ] Unit tests for ExportService
- [ ] Widget tests for TranslationScreen
- [ ] Widget tests for ProjectManagementScreen

### Technical Debt
- [ ] Add proper error handling for all service calls
- [ ] Add loading states for all async operations
- [ ] Add pagination for large entity/glossary lists
- [ ] Add search/filter for projects and memories
