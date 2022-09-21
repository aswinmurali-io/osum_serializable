# osum_serializable

[![osum_serializable](https://github.com/aswinmurali-io/osum_serializable/actions/workflows/osum_serializable.yaml/badge.svg)](https://github.com/aswinmurali-io/osum_serializable/actions/workflows/osum_serializable.yaml)

The goal is to serialize almost everything you ever need! `json_serializable` is an amazing package to serialize classes but cannot serialize complex types. This package provides convertors for these types. Check the supported types to know more.

## Supported types

|Type|Support|Type|Support|
|---|---|---|---|
|`Color`|✅|`MaterialColor`|✅|
|`Offset`|✅|`Size`|✅|
|`Directory`|✅|`File`|✅|
|`DateTime`|✅|`IconData`|✅|
|`Duration`|✅|`UuidValue`|✅|
|`Locale` |✅|

## How it works

|Code|Json|
|----|----|
| <img width="350" src="https://user-images.githubusercontent.com/47299190/191183909-945166ce-ebd8-475c-8983-bbfb4a9377f6.png"/> | <img width="250" src="https://user-images.githubusercontent.com/47299190/191183957-be602b49-187a-4064-9578-d3fdd0cd5c50.png"/> |

## How to use?

### Install

`osum_serializable` depends on `build_runner` and `json_serializable` to building the `toJson` and `fromJson` implementations. To install run these commands in your terminal.

```bash
flutter pub add --dev build_runner
flutter pub add --dev json_serializable
flutter pub add osum_serializable
```

### Usage

To use the convertors, simply postfix the data type name with `Convertor` and call the annotation.

```dart
@{DATATYPE}Converter()
final {DATATYPE} variable;
```

For example, serializing `IconData` can be done like this.

```dart
@IconDataConverter()
final IconData variable;
```

### Example

Refer the example section for the full code.

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

Finally, don't forget to call the `build_runner` to generate the json implementation.

```bash
flutter pub run build_runner build
```
