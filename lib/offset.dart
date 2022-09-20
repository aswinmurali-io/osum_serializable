import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

class OffsetConverter extends JsonConverter<Offset, List<double>> {
  /// Serialize [Offset] to [List].
  const OffsetConverter();

  @override
  Offset fromJson(List<double> json) => Offset(json[0], json[1]);

  @override
  List<double> toJson(Offset object) => [object.dx, object.dy];
}
