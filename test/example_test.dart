import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../example/example.dart';

void testExample() {
  test('Checking example to json conversion.', () {
    final eg = Example(
      Directory.current,
      File("test.txt"),
      const Color(0x000000FF),
      Duration.zero,
      Colors.amber,
    );

    // ignore: avoid_print
    print(eg.toJson());
  });
}

void main() => testExample();
