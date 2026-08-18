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
      parseResponseFile(filename);
    }
    x += 1;
  }
  return args;
}

void parseResponseFile(String filename) {
  var (content, error) = readFileToString(filename);
  if (error.code == 0) {
    print(content);
  } else {
    error.printMessage();
  }
}
