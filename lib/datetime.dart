import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter extends JsonConverter<DateTime, int> {
  /// Serialize [DateTime] to [int].
  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
