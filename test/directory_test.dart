import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'directory_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @DirectoryConverter()
  final Directory value;

  Json toJson() => _$SerializableToJson(this);
}

void testDirectory() {
  final value = Directory.current;
  final json = {'value': Directory.current.path};

  final serializable = _Serializable(value);

  test(
    'Serializing directory to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading directory from json.',
    () => expect(_Serializable.fromJson(json).value.path, value.path),
  );
}

void main() => testDirectory();
