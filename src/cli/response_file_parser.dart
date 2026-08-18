import '../diagnostics.dart';
import '../utils/file_io.dart';

List<String> expandResponseFiles(List<String> args) {
  args = [...args];
  var responseFilesCount = 0;
  var x = 0;
  while (x < args.length) {
    if (args[x].startsWith("@")) {
      var filename = args[x].substring(1);
      if (responseFilesCount > 200) {}
      responseFilesCount += 1;
      var (tempArgs, parseError) = parseResponseFile(filename);
      if (parseError.code == 0) {
        for (var arg in tempArgs) {
          print(arg);
        }
      } else {
        parseError.printMessage();
      }
    }
    x += 1;
  }
  return args;
}

(List<String>, DiagnosticMessage) parseResponseFile(String filename) {
  List<String> args = [];
  var error = createDiagnosticMessage(0, []);

  var (content, readError) = readFileToString(filename);
  if (readError.code != 0) {
    //Return the read error
    error = readError;
    return (args, error);
  }

  var x = 0;
  while (x < content.length) {
    if (content.codeUnitAt(x) <= 32) {
      //Skip whitespace characters
    } else if (content[x] == '"') {
      //Parse quoted string
      var endQuote = false;
      var y = x + 1;
      while (y < content.length) {
        if (content[y] == '"') {
          endQuote = true;
          break;
        }
        y += 1;
      }
      if (endQuote) {
        args.add(content.substring(x + 1, y));
        x = y;
      } else {
        //Unterminated quoted string error
        error = createDiagnosticMessage(6045, [filename]);
        return (args, error);
      }
    } else {
      //Parse unquoted string
      var y = x;
      while (y < content.length && content.codeUnitAt(y) > 32) {
        y += 1;
      }
      args.add(content.substring(x, y));
      x = y;
    }
    x += 1;
  }

  return (args, error);
}
