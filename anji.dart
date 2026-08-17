import 'src/cli/arg_parser.dart';
import 'src/env_variables.dart';

void main(List<String> args) {
  //Check for ANJI env variables and set their booleans
  getAndSetEnvironmentVariables();

  //Compiler has two modes: normal mode and build mode
  if (args.length > 0 && (args[0] == "--build" || args[0] == "-b")) {
    //Build mode
  } else {
    //Normal mode
    parseArgs(args);
  }
}
