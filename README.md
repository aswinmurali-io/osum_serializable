# osum_serializable

The goal is to serialize almost everything you every need! `json_serializable` is an amazing package to serialize classes but cannot serialize complex types. This package supports serializing `Color`, `DateTime`, `Directory`, `File`, `Duration`, and many more.

## How to use?

```dart
part 'test.g.dart';

@JsonSerializable()
class Example {
  const Example(this.directory, this.file, this.color);

  factory Example.fromJson(Json json) => _$ExampleFromJson(json);

  @DirectoryConverter()  // <- Convertors provided by osum_serializable!
  final Directory directory;

  @FileConverter()
  final File file;

  @ColorConvertor()
  final Color color;

  Json toJson() => _$ExampleToJson(this);
}
```
