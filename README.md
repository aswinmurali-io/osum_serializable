# osum_serializable

The goal is to serialize almost everything you ever need! `json_serializable` is an amazing package to serialize classes but cannot serialize complex types. This package supports serializing `Color`, `DateTime`, `Directory`, `File`, `Duration`, and many more.

## Supports

|Types|Support|
|---|---|
|`Color`|✅|
|`DateTime`|✅|
|`Directory`|✅|
|`File`|✅|
|`Duration`|✅|

## How to use?

```dart
// imports ...
part 'test.g.dart';

@JsonSerializable()
class Example {
  const Example(this.directory, this.file, this.color);

  factory Example.fromJson(Json json) => _$ExampleFromJson(json);

  @DirectoryConverter()  // <- Converters provided by osum_serializable!
  final Directory directory;

  @FileConverter()
  final File file;

  @ColorConverter()
  final Color color;

  Json toJson() => _$ExampleToJson(this);
}
```
