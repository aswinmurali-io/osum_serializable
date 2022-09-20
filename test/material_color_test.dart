import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'material_color_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @MaterialColorConverter()
  final MaterialColor value;

  Json toJson() => _$SerializableToJson(this);
}

void testMaterialColor() {
  const value = Colors.amber;
  const amberPrimaryValue = 0xFFFFC107;

  const json = {
    'value': {
      'primary': amberPrimaryValue,
      'shade50': 0xFFFFF8E1,
      'shade100': 0xFFFFECB3,
      'shade200': 0xFFFFE082,
      'shade300': 0xFFFFD54F,
      'shade400': 0xFFFFCA28,
      'shade500': amberPrimaryValue,
      'shade600': 0xFFFFB300,
      'shade700': 0xFFFFA000,
      'shade800': 0xFFFF8F00,
      'shade900': 0xFFFF6F00,
    },
  };

  const serializable = _Serializable(value);

  test(
    'Serializing material color to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading material color from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );
}

void main() => testMaterialColor();
