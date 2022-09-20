import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'size_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @SizeConverter()
  final Size value;

  Json toJson() => _$SerializableToJson(this);
}

void testSize() {
  const value = Size(700, 900);
  // double data type because Size has `Size(double, double)` constructor.
  const json = {
    'value': [700.0, 900.0]
  };

  const serializable = _Serializable(value);

  test(
    'Serializing size to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading size from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );
}

void main() => testSize();
