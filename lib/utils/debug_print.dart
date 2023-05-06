import 'package:flutter/material.dart';

class DebugService {
  void debugPrintStack({required String label,required int maxFrames}) {
    if (label != null) debugPrint(label);
    Iterable<String> lines =
        StackTrace.current.toString().trimRight().split('\n');
    if (maxFrames != null) lines = lines.take(maxFrames);
    debugPrint(FlutterError.defaultStackFilter(lines).join('\n'));
  }
}
