import 'env_variables.dart';

class DiagnosticMessage {
  int code;
  String message;
  String category;
  String comment;
  DiagnosticMessage(this.code, this.message, this.category, this.comment);
  void printMessage() {
    print(this.category + ' $code: ' + this.message);
    if (ANJI_DIAGNOSTIC_COMMENTS) {
      print(this.comment);
    }
  }
}

final List<DiagnosticMessage> diagnostic_messages = [
  DiagnosticMessage(
    100000,
    "Too many response files provided. Circular reference suspected in file '{}'.",
    "error",
    "Abe, ek hi file kitni bar kholun?",
  ),
];

DiagnosticMessage createDiagnosticMessage(int code, List<String> args) {
  for (var diagnostic in diagnostic_messages) {
    if (diagnostic.code == code) {
      var msg = diagnostic.message;
      //replace placeholders with actual values
      for (var arg in args) {
        msg = msg.replaceFirst('{}', arg);
      }
      return DiagnosticMessage(
        diagnostic.code,
        msg,
        diagnostic.category,
        diagnostic.comment,
      );
    }
  }

  throw Exception('Unknown diagnostic code: $code');
}
