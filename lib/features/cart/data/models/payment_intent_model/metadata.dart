import 'package:json_annotation/json_annotation.dart';
part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
