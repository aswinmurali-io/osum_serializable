import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'file_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @FileConverter()
  final File value;

  Json toJson() => _$SerializableToJson(this);
}

void testFile() {
  final value = File("test.txt");
  final json = {'value': value.path};

  final serializable = _Serializable(value);

  test(
    'Serializing file to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading file from json.',
    () => expect(_Serializable.fromJson(json).value.path, value.path),
  );
}

void main() => testFile();
