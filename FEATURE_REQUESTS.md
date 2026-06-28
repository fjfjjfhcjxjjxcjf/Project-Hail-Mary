# Project Hail Mary - Feature Requests

These features are planned for future versions. None are in active development.
The next milestone is First Build Validation (v4.1.0) -- no new features until
the first successful Flutter build has been completed.

---

## v2.1.0 - Image and Visual Translation

### Vision API Integration
- Use GPT-4V or Gemini Vision to detect text in images
- Support manga/comic speech bubbles, captions, labels, signs
- Extract text positions and styles

### Text Inpainting
- Remove original text from images
- Reconstruct background using AI inpainting
- Preserve artwork integrity

### Text Overlay
- Insert translated text at detected positions
- Match original font, size, style, shadow, outline
- Handle rotation and perspective
- Auto-resize for target language length

### OCR Pipeline
- Process scanned PDFs with OCR
- Extract text from image-only pages
- Support multiple OCR engines as plugins

## v2.1.0 - Deep Mode

### Full Pipeline
1. Analyze entire document (BookAnalysisService)
2. Extract characters, places, terminology
3. Create/update Translation Memory
4. Create/update Glossary
5. Translate all chunks with context awareness
6. Run AI Review on each chunk
7. Run Global Consistency Check
8. Generate Quality Report

### Progress Tracking
- Show current pipeline stage
- Per-stage progress bars
- Estimated time remaining
- Cancel at any stage

## v2.1.0 - Translation Comparison

### Multi-Model Comparison
- Translate same text with multiple providers
- Display side-by-side results
- Show quality scores per candidate
- Show cost and time per candidate
- Allow selecting preferred translation

### Comparison History
- Save comparison results
- Track which providers perform best for specific content types
- Build provider preference over time

## v2.2.0 - Export

### File Export
- Save to device storage
- Support PDF, EPUB, DOCX, TXT, HTML, Markdown
- Preserve formatting in exported files

### Bilingual Export
- Original only
- Translation only
- Original + Translation (interleaved)
- Side-by-side comparison

### Print-Ready Output
- Page layout for printing
- Custom headers/footers
- Page numbering

## v2.2.0 - Series and Universe Memory

### Series Memory
- Link projects as volumes in a series
- Share entities across volumes
- Automatic entity propagation to new volumes
- Series-level glossary

### Universe Memory
- Share entities across unrelated projects
- Shared terminology databases
- Character name consistency across projects
- Import/export universe data

## v3.0.0 - Platform Expansion

### Web Version
- Flutter web build
- Browser-based translation
- Shared project links
- No installation required

### Desktop Version
- Windows, Mac, Linux builds
- Native file system integration
- System tray notifications
- Keyboard shortcuts

### Cloud Sync
- Sync projects across devices
- Cloud backup for translation memory
- Real-time collaboration
- Shared workspaces
