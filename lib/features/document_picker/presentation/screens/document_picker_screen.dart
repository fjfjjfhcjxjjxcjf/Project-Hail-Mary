import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/document.dart';

const _uuid = Uuid();

class DocumentPickerScreen extends ConsumerWidget {
  const DocumentPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Select Document')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Quick pick section
          Text('Import from', style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          )),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ImportCard(
                  icon: Icons.phone_android,
                  label: 'Device Storage',
                  onTap: () => _pickFromDevice(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ImportCard(
                  icon: Icons.folder_open,
                  label: 'File Manager',
                  onTap: () => _pickFromFileManager(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Supported formats info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 20, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Text('Supported Formats', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: AppConstants.supportedDocumentFormats
                        .map((f) => f.toUpperCase())
                        .toSet()
                        .toList()
                        .map((f) => Chip(
                              label: Text(f, style: const TextStyle(fontSize: 11)),
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 20, color: colorScheme.secondary),
                      const SizedBox(width: 8),
                      Text('OCR Support', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Scanned PDFs and images are automatically processed with OCR to extract text.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Image picker for OCR
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.image, size: 20, color: colorScheme.tertiary),
                      const SizedBox(width: 8),
                      Text('Image Translation', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Pick Image for OCR'),
                      onPressed: () => _pickImage(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickFromDevice(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: AppConstants.supportedDocumentFormats,
        withData: false,
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final doc = Document(
          id: _uuid.v4(),
          name: file.name,
          path: file.path ?? '',
          format: DocumentFormat.fromExtension(file.extension ?? ''),
          sizeBytes: file.size,
          addedAt: DateTime.now(),
        );

        if (context.mounted) {
          _showDocumentPicked(context, doc);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking file: $e')),
        );
      }
    }
  }

  void _pickFromFileManager(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final ext = file.extension?.toLowerCase() ?? '';

        if (!AppConstants.supportedDocumentFormats.contains(ext) &&
            !AppConstants.supportedImageFormats.contains(ext)) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Unsupported format: .$ext')),
            );
          }
          return;
        }

        final doc = Document(
          id: _uuid.v4(),
          name: file.name,
          path: file.path ?? '',
          format: DocumentFormat.fromExtension(ext),
          sizeBytes: file.size,
          addedAt: DateTime.now(),
        );

        if (context.mounted) {
          _showDocumentPicked(context, doc);
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking file: $e')),
        );
      }
    }
  }

  void _pickImage(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: AppConstants.supportedImageFormats,
        withData: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        if (context.mounted) {
          // Navigate to translate with image path — OCR will happen there
          final encodedPath = Uri.encodeComponent(file.path ?? '');
          final encodedName = Uri.encodeComponent(file.name);
          context.go('/translate?file=$encodedPath&name=$encodedName');
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _showDocumentPicked(BuildContext context, Document doc) {
    // Navigate directly to translate with file info
    final encodedPath = Uri.encodeComponent(doc.path);
    final encodedName = Uri.encodeComponent(doc.name);
    context.go('/translate?file=$encodedPath&name=$encodedName');
  }

}

class _ImportCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ImportCard({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Icon(icon, size: 32, color: colorScheme.onPrimaryContainer),
              const SizedBox(height: 8),
              Text(label, style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colorScheme.onPrimaryContainer,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
