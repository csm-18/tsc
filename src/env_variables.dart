import 'dart:io';

var ANJI_DIAGNOSTIC_COMMENTS = false;
void getAndSetEnvironmentVariables() {
  if (Platform.environment.containsKey('ANJI_DIAGNOSTIC_COMMENTS')) {
    ANJI_DIAGNOSTIC_COMMENTS = true;
  }
}
