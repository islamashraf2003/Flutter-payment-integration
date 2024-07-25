import 'package:json_annotation/json_annotation.dart';
part 'payment_intent_input_model.g.dart';

@JsonSerializable()
class PaymentIntentInputModel {
  String amount;
  String currency;
  @JsonKey(name: "customer")
  String? customerId;
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });
  Map<String, dynamic> toJson() => _$PaymentIntentInputModelToJson(this);
}
