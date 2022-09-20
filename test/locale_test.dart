import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'locale_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @LocaleConverter()
  final Locale value;

  Json toJson() => _$SerializableToJson(this);
}

void testLocale() {
  const value = Locale('fr', 'CH');

  final json = {
    'value': {
      'countryCode': value.countryCode!,
      'languageCode': value.languageCode,
    },
  };

  const serializable = _Serializable(value);

  test(
    'Serializing locale to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading locale from json.',
    () => expect(_Serializable.fromJson(json).value, value),
  );

  const nullableValue = Locale('fr');

  final nullableJson = {
    'value': {
      'countryCode': null,
      'languageCode': value.languageCode,
    },
  };

  const nullableSerializable = _Serializable(nullableValue);

  test(
    'Serializing nullable locale to json.',
    () => expect(nullableSerializable.toJson(), nullableJson),
  );

  test(
    'Loading locale from nullable json.',
    () => expect(_Serializable.fromJson(nullableJson).value, nullableValue),
  );
}

void main() => testLocale();
