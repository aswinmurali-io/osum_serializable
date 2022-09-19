import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class DirectoryConverter extends JsonConverter<Directory, String> {
  /// Serialize [Directory] to [String].
  const DirectoryConverter();

  @override
  Directory fromJson(String json) => Directory(json);

  @override
  String toJson(Directory object) => object.path;
}
