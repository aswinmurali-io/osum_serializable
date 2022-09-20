import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

class SizeConverter extends JsonConverter<Size, List<double>> {
  /// Serialize [Size] to [List].
  const SizeConverter();

  @override
  Size fromJson(List<double> json) => Size(json[0], json[1]);

  @override
  List<double> toJson(Size object) => [object.width, object.height];
}
