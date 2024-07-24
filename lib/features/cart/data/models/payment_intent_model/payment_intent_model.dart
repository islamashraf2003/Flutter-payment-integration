import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_model.g.dart';

@JsonSerializable()
class PaymentIntentModel {
  @JsonKey(name: 'client_secret')
  final String? clientSecret;

  PaymentIntentModel({this.clientSecret});

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentModelToJson(this);
}
