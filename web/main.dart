import 'dart:html';
import 'package:c3/c3.dart' as c3;
import 'package:grizzly_io/grizzly_io.dart';

final parser = CsvParser(fieldSep: '\t');

class Data {
  DateTime time;

  bool win;
}

void main() {
  (querySelector('#select-file') as FileUploadInputElement)
      .onChange
      .listen((f) {
    final FileUploadInputElement input = f.target;

    final reader = FileReader();
    reader.onLoad.listen((e) {
      final data = parser.convert(reader.result);
      print(data);
      input.value = '';
    });
    reader.onError.listen((e) {
      print("error");
      input.value = '';
    });
    reader.readAsText(input.files.first.slice());

  });

  querySelector('#output').text = 'Your Dart app is running.';


  // parser.convert();
}
