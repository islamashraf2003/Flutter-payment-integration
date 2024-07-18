import 'package:flutter/material.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_item.dart';

class PaymentItemsList extends StatelessWidget {
  const PaymentItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentItem(
          image: "assets/images/card_payment_image.svg",
          isActive: true,
        ),
        PaymentItem(
          image: "assets/images/paybal_image.svg",
          isActive: false,
        ),
      ],
    );
  }
}
