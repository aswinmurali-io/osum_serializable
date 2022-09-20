import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'offset_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @OffsetConverter()
  final Offset value;

  Json toJson() => _$SerializableToJson(this);
}

void testOffset() {
  const value = Offset(10, 10);
  // double data type because Offset has `Offset(double, double)` constructor.
  const json = {
    'value': [10.0, 10.0]
  };

  const serializable = _Serializable(value);

  test(
    'Serializing offset to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading offset from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );
}

void main() => testOffset();
