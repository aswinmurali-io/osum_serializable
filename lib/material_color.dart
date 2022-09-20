import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class MaterialColorConverter
    extends JsonConverter<MaterialColor, Map<String, int>> {
  /// Serialize [MaterialColor] to [Map].
  const MaterialColorConverter();

  @override
  MaterialColor fromJson(Map<String, int> json) {
    return MaterialColor(json['primary']!, {
      50: Color(json['shade50']!),
      100: Color(json['shade100']!),
      200: Color(json['shade200']!),
      300: Color(json['shade300']!),
      400: Color(json['shade400']!),
      500: Color(json['shade500']!),
      600: Color(json['shade600']!),
      700: Color(json['shade700']!),
      800: Color(json['shade800']!),
      900: Color(json['shade900']!),
    });
  }

  @override
  Map<String, int> toJson(MaterialColor object) {
    return {
      'primary': object.value,
      'shade50': object.shade50.value,
      'shade100': object.shade100.value,
      'shade200': object.shade200.value,
      'shade300': object.shade300.value,
      'shade400': object.shade400.value,
      'shade500': object.shade500.value,
      'shade600': object.shade600.value,
      'shade700': object.shade700.value,
      'shade800': object.shade800.value,
      'shade900': object.shade900.value,
    };
  }
}
