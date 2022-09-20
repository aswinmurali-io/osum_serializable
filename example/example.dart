import 'dart:io';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
  const Example(this.directory, this.file, this.color, this.duration);

  factory Example.fromJson(Json json) => _$ExampleFromJson(json);

  @DirectoryConverter() // <- Convertors provided by osum_serializable!
  final Directory directory;

  @FileConverter()
  final File file;

  @ColorConverter()
  final Color color;

  @DurationConverter()
  final Duration duration;

  Json toJson() => _$ExampleToJson(this);
}

void main() {
  final eg = Example(
    Directory.current,
    File("test.txt"),
    const Color(0x000000FF),
    Duration.zero,
  );

  // ignore: avoid_print
  print(eg.toJson());
}
