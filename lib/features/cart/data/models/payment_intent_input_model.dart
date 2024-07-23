class PaymentIntentInputModel {
  String? amount;
  String? currency;

  PaymentIntentInputModelToJson() => {
        'amount': amount,
        'currency': currency,
      };
}
