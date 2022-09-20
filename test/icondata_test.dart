import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'icondata_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @IconDataConverter()
  final IconData value;

  Json toJson() => _$SerializableToJson(this);
}

void testIconData() {
  const value = Icons.abc;

  final json = {
    'value': {
      'codePoint': '${value.codePoint}',
      'fontFamily': value.fontFamily,
      'fontPackage': value.fontPackage,
      'matchTextDirection': '${value.matchTextDirection}',
    },
  };

  const serializable = _Serializable(value);

  test(
    'Serializing icon data to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading icon data color from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );
}

void main() => testIconData();
