class PaymentIntentInputModelP {
  String? amount;
  String? currency;

  Map<String, dynamic> paymentIntentInputModelPToJson() => {
        'amount': amount,
        'currency': currency,
      };
}
