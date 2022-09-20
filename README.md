# osum_serializable

[![osum_serializable](https://github.com/aswinmurali-io/osum_serializable/actions/workflows/osum_serializable.yaml/badge.svg)](https://github.com/aswinmurali-io/osum_serializable/actions/workflows/osum_serializable.yaml)

The goal is to serialize almost everything you ever need! `json_serializable` is an amazing package to serialize classes but cannot serialize complex types.

## Supported types

|Type|Support|Type|Support|
|---|---|---|---|
|`Color`|✅|`MaterialColor`|✅|
|`Offset`|✅|`Size`|✅|
|`Directory`|✅|`File`|✅|
|`DateTime`|✅|`IconData`|✅|
|`Duration`|✅|
|`Locale` |✅|

## How to use?

```dart
// imports ...
part 'test.g.dart';

@JsonSerializable()
class Example {
  const Example(this.directory, this.file, this.color, this.duration, this.materialColor);

  factory Example.fromJson(Json json) => _$ExampleFromJson(json);

  @DirectoryConverter() // <- Convertors provided by osum_serializable!
  final Directory directory;

  @MaterialColorConverter()
  final MaterialColor materialColor;

  @FileConverter()
  final File file;

  @ColorConverter()
  final Color color;

  @DurationConverter()
  final Duration duration;

  Json toJson() => _$ExampleToJson(this);
}
```
