import 'dart:io';

import '../diagnostics.dart';

(String, DiagnosticMessage) readFileToString(String filename) {
  String content = "";
  final file = File(filename);

  try {
    content = file.readAsStringSync();
  } on FileSystemException catch (_) {
    //Cannot read file error
    return (content, createDiagnosticMessage(5083, [filename]));
  }

  return (content, createDiagnosticMessage(0, []));
}
