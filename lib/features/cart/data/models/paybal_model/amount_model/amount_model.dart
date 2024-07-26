import 'package:json_annotation/json_annotation.dart';

import 'details.dart';
part 'amount_model.g.dart';

@JsonSerializable()
class AmountModel {
  final String total;
  final String currency;
  final Details details;

  AmountModel(
      {required this.total, required this.currency, required this.details});

  factory AmountModel.fromJson(Map<String, dynamic> json) =>
      _$AmountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AmountModelToJson(this);
}
