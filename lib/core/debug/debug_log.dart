import 'package:flutter/foundation.dart';

/// A circular buffer of recent log messages that can be displayed
/// as a debug overlay in the UI. Uses debugPrint so messages also
/// appear in logcat / Xcode console.
class DebugLog {
  DebugLog._();
  static final instance = DebugLog._();

  final List<String> _lines = [];
  final ValueNotifier<int> notifier = ValueNotifier(0);
  static const maxLines = 80;

  void log(String tag, String message) {
    final ts = DateTime.now().toIso8601String().substring(11, 23);
    final line = '[$ts] $tag  $message';
    _lines.add(line);
    if (_lines.length > maxLines) _lines.removeAt(0);
    notifier.value++;
    debugPrint(line);
  }

  List<String> get lines => List.unmodifiable(_lines);

  void clear() {
    _lines.clear();
    notifier.value++;
  }
}

/// Shorthand for DebugLog.instance.log
void dlog(String tag, String msg) => DebugLog.instance.log(tag, msg);
