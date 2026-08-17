import '../diagnostics.dart';

List<String> expandResponseFiles(List<String> args) {
  args = [...args];
  var responseFilesCount = 0;
  var x = 0;
  while (x < args.length) {
    if (args[x].startsWith("@")) {
      var filename = args[x].substring(1);
      if (responseFilesCount > 200) {}
      responseFilesCount += 1;
      parseResponseFile(filename);
    }
    x += 1;
  }
  var error = createDiagnosticMessage(100000, ["hello.txt"]);
  error.printMessage();

  return args;
}

void parseResponseFile(String filename) {}
