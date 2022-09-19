import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'color_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @ColorConverter()
  final Color value;

  Json toJson() => _$SerializableToJson(this);
}

void testColor() {
  const value = Color(0xFFFFC107);
  const json = {'value': 0xFFFFC107};

  const serializable = _Serializable(value);

  test(
    'Serializing color to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading color from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );
}

void main() => testColor();
