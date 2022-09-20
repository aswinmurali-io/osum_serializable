import 'dart:io';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import '../example/example.dart';

void main() {
  test('Checking example to json conversion.', () {
    final eg = Example(
      Directory.current,
      File("test.txt"),
      const Color(0x000000FF),
      Duration.zero,
    );

    print(eg.toJson());
  });
}