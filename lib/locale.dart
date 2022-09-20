import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

class LocaleConverter extends JsonConverter<Locale, Map<String, String?>> {
  /// Serialize [Locale] to [Map].
  const LocaleConverter();

  @override
  Locale fromJson(Map<String, String?> json) =>
      Locale(json['languageCode']!, json['countryCode']);

  @override
  Map<String, String?> toJson(Locale object) {
    return {
      'countryCode': object.countryCode,
      'languageCode': object.languageCode,
    };
  }
}
