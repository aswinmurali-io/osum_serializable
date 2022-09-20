import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'duration_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @DurationConverter()
  final Duration value;

  Json toJson() => _$SerializableToJson(this);
}

void testDuration() {
  const value = Duration.zero;
  final json = {'value': value.inMilliseconds};

  const serializable = _Serializable(value);

  test(
    'Serializing duration to json.',
    () => expect(serializable.toJson(), json),
  );

  test(
    'Loading duration from json.',
    () => expect(
      _Serializable.fromJson(json).value,
      value,
    ),
  );
}

void main() => testDuration();
