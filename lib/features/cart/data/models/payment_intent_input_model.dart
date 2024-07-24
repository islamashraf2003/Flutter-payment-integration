import 'package:json_annotation/json_annotation.dart';
part 'payment_intent_input_model.g.dart';

@JsonSerializable()
class PaymentIntentInputModel {
  String? amount;
  String? currency;

  PaymentIntentInputModel({
    this.amount,
    this.currency,
  });
  Map<String, dynamic> toJson() => _$PaymentIntentInputModelToJson(this);
}
