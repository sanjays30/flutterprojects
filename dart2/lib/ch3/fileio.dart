//The dart:io library is aimed at code that runs in Flutter and the standalone Dart VM
//Dart is a single-threaded programming language. If an operation blocks the Dart thread,
//the application makes no progress before that operation completes.
//For scalability it is therefore crucial that no I/O operations block.
//Instead of blocking on I/O operations, dart:io uses an asynchronous programming model

import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';

main() {
  //printThisFile();
  readFileRandonAccess().then((data) {
    print(data);
  });
  readFileStream().then((data) {
    print(data);
  });
}

Future<void> printThisFile() async {
  var file = File(Platform.script.toFilePath());
  String data = await (file.readAsString(encoding: ascii));
  print("${data}");
}

Future<String> readFileRandonAccess() async {
  var data = <int>[];
  final script = File(Platform.script.toFilePath());
  RandomAccessFile file = await script.open(mode: FileMode.read);
  while (true) {
    int byte = await file.readByte();
    if (byte == -1) {
      await file.close();
      break;
    }
    data.add(byte);
  }
  return String.fromCharCodes(data);
}

Future<String> readFileStream() async {
  var result = <int>[];
  final script = File(Platform.script.toFilePath());
  var reader = script.openRead();
  await for (var data in reader) {
    for (int i = 0; i < data.length; i++) {
      result.add(data[i]);
    }
  }
  return String.fromCharCodes(result);
}
