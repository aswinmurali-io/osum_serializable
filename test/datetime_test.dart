import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:osum_serializable/osum_serializable.dart';

part 'datetime_test.g.dart';

@JsonSerializable()
class _Serializable {
  const _Serializable(this.value);

  factory _Serializable.fromJson(Json json) => _$SerializableFromJson(json);

  @DateTimeConverter()
  final DateTime value;

  Json toJson() => _$SerializableToJson(this);
}

void testDateTime() {
  final value = DateTime.now();
  final json = {'value': value.millisecondsSinceEpoch};

  final serializable = _Serializable(value);

  test(
    'Serializing date time to json.',
    () => expect(serializable.toJson(), json),
  );

  /*
  NOTE: The test can fail because of precision loss when doing
  direct comparison.

  TestFailure (Expected: DateTime:<2022-09-20 00:10:57.243468>
    Actual: DateTime:<2022-09-20 00:10:57.243>
  )
  */

  /// Convert date time to human readable string with NO millisecond precision.
  String toIntl(DateTime now) => DateFormat('yyyy-MM-dd kk:mm:ss').format(now);

  test(
    'Loading date time from json.',
    () => expect(toIntl(_Serializable.fromJson(json).value), toIntl(value)),
  );
}

void main() => testDateTime();
