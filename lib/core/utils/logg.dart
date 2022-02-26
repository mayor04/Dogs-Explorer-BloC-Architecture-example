import 'dart:developer';

const String errorAnsi = '\u001b[31m';
const String debugAnsi = '\u001b[32m';
const String whiteAnsi = '\u001b[37m';

//Draws line to create a demarkation for the logs
String getLine(int count) {
  String equal = '-';

  for (int i = 0; i < count; i++) {
    equal += '-';
  }

  return equal;
}

void logD(String from, var objects) {
  log('$whiteAnsi${getLine(170)}');
  log('$debugAnsi$objects', name: '$debugAnsi$from');
}

logE(String from, String error) {
  log('$errorAnsi$error', name: '$errorAnsi$from');
}

logI(String from, var info) {
  log('$info', name: from);
}
