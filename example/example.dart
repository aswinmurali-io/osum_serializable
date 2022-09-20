// ignore_for_file: require_trailing_commas

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
  const Example(this.directory, this.file, this.color, this.duration,
      this.materialColor, this.locale, this.size, this.iconData);

  // Json methods.
  factory Example.fromJson(Json json) => _$ExampleFromJson(json);
  Json toJson() => _$ExampleToJson(this);

  @DirectoryConverter() // <- Convertors provided by osum_serializable!
  final Directory directory;

  @FileConverter()
  final File file;

  @ColorConverter()
  final Color color;

  @MaterialColorConverter()
  final MaterialColor materialColor;

  @DurationConverter()
  final Duration duration;

  @SizeConverter()
  final Size size;

  @LocaleConverter()
  final Locale locale;

  @IconDataConverter()
  final IconData iconData;
}

void main() {
  final eg = Example(
    Directory.current,
    File("test.txt"),
    const Color(0x000000FF),
    Duration.zero,
    Colors.amber,
    const Locale('fr'),
    Size.zero,
    Icons.abc,
  );

  // ignore: avoid_print
  print(eg.toJson());
}
