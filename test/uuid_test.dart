import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';
import 'package:uuid/uuid.dart';

part 'uuid_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @UuidValueConverter()
  final UuidValue value;

  Json toJson() => _$SerializableToJson(this);
}

void testUuidValue() {
  final value = const Uuid().v4obj();
  final json = {'value': value.uuid};

  final serializable = _Serializable(value);

  test(
    'Serializing uuid value to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading uuid value from json.',
    () => expect(_Serializable.fromJson(json).value.uuid, value.uuid),
  );
}

void main() => testUuidValue();
