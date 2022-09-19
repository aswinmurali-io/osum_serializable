import 'package:json_annotation/json_annotation.dart';

class DurationConverter extends JsonConverter<Duration, int> {
  /// Serialize [Duration] to [int].
  const DurationConverter();

  @override
  Duration fromJson(int json) => Duration(milliseconds: json);

  @override
  int toJson(Duration object) => object.inMilliseconds;
}
