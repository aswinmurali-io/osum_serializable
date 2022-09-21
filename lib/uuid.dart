import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class UuidValueConverter extends JsonConverter<UuidValue, String> {
  /// Serialize [UuidValue] to [String].
  const UuidValueConverter();

  @override
  UuidValue fromJson(String json) => UuidValue(json);

  @override
  String toJson(UuidValue object) => object.uuid;
}
