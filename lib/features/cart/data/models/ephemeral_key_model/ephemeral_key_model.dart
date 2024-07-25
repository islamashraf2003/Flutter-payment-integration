import 'package:json_annotation/json_annotation.dart';

import 'associated_object.dart';

part 'ephemeral_key_model.g.dart';

@JsonSerializable()
class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) =>
      _$EphemeralKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralKeyModelToJson(this);
}
