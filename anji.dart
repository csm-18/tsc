import 'src/cli/arg_parser.dart';

void main(List<String> args) {
  //Compiler has two modes: normal mode and build mode
  if (args.length > 0 && (args[0] == "--build" || args[0] == "-b")) {
    //Build mode
  } else {
    //Normal mode
    parseArgs(args);
  }
}
