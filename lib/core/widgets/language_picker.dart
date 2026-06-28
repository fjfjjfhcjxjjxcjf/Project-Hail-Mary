import 'package:flutter/material.dart';
import '../data/languages.dart';

/// Shows a searchable language picker dialog.
/// Returns the selected Language code, or null if cancelled.
Future<String?> showLanguagePicker(
  BuildContext context, {
  String? currentCode,
  bool includeAutoDetect = true,
}) {
  return showDialog<String>(
    context: context,
    builder: (context) => _LanguagePickerDialog(
      currentCode: currentCode,
      includeAutoDetect: includeAutoDetect,
    ),
  );
}

class _LanguagePickerDialog extends StatefulWidget {
  final String? currentCode;
  final bool includeAutoDetect;

  const _LanguagePickerDialog({
    this.currentCode,
    this.includeAutoDetect = true,
  });

  @override
  State<_LanguagePickerDialog> createState() => _LanguagePickerDialogState();
}

class _LanguagePickerDialogState extends State<_LanguagePickerDialog> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languages = widget.includeAutoDetect
        ? Languages.common
        : Languages.common.where((l) => l.code != 'auto').toList();

    final filtered = _query.isEmpty
        ? languages
        : languages.where((l) {
            final q = _query.toLowerCase();
            return l.name.toLowerCase().contains(q) ||
                l.nativeName.toLowerCase().contains(q) ||
                l.code.toLowerCase().contains(q);
          }).toList();

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 560),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Select Language',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search languages...',
                  prefixIcon: Icon(Icons.search),
                  isDense: true,
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final lang = filtered[index];
                  final isSelected = lang.code == widget.currentCode;
                  return ListTile(
                    dense: true,
                    selected: isSelected,
                    leading: isSelected
                        ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                        : const SizedBox(width: 24),
                    title: Text(lang.name),
                    subtitle: lang.code != 'auto'
                        ? Text(lang.nativeName, style: const TextStyle(fontSize: 12))
                        : null,
                    onTap: () => Navigator.pop(context, lang.code),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
