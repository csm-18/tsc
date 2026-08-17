import 'dart:io';

import '../diagnostics.dart';

(String, DiagnosticMessage) readFileToString(String filename) {
  String content = "";
  final file = File(filename);
  if (!file.existsSync()) {
    //Cannot read file error
    return (content, createDiagnosticMessage(5083, [filename]));
  } else {
    try {
      content = file.readAsStringSync();
    } on FileSystemException catch (e) {
      //Cannot read file error with reason
      return (content, createDiagnosticMessage(5012, [filename, e.message]));
    }
  }

  return (content, createDiagnosticMessage(0, []));
}
