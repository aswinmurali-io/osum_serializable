import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class IconDataConverter extends JsonConverter<IconData, Map<String, String?>> {
  /// Serialize [IconData] to [Map].
  const IconDataConverter();

  @override
  IconData fromJson(Map<String, String?> json) {
    return IconData(
      int.parse(json['codePoint']!),
      fontFamily: json['fontFamily'],
      fontPackage: json['fontPackage'],
      matchTextDirection: json['matchTextDirection'] == 'true',
    );
  }

  @override
  Map<String, String?> toJson(IconData object) {
    return {
      'codePoint': '${object.codePoint}',
      'fontFamily': object.fontFamily,
      'fontPackage': object.fontPackage,
      'matchTextDirection': '${object.matchTextDirection}',
    };
  }
}
