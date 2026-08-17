class DiagnosticMessage {
  int code;
  String message;
  String category;
  DiagnosticMessage(this.code, this.message, this.category);
  void printMessage() {
    print(this.category + ' $code: ' + this.message);
  }
}

final List<DiagnosticMessage> diagnostic_messages = [
  DiagnosticMessage(
    100,
    "Too many response files provided. Circular reference suspected in file '{}'.",
    "error",
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
      return DiagnosticMessage(diagnostic.code, msg, diagnostic.category);
    }
  }

  throw Exception('Unknown diagnostic code: $code');
}
