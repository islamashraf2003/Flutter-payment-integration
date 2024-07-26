import 'package:flutter/material.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';
import 'package:payment_integration/features/cart/ui/widgets/titile_and_price.dart';

class CustomCardDetails extends StatelessWidget {
  const CustomCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndPrice(
          title: "Order Subtotal",
          price: 42.07,
        ),
        verticalSpace(6),
        const TitleAndPrice(
          title: "Discount",
          price: 0,
        ),
        verticalSpace(6),
        const TitleAndPrice(
          title: "Shipping",
          price: 8,
        ),
        verticalSpace(10),
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: ColorsManager.gray,
                thickness: 2,
              ),
            ),
          ],
        ),
        verticalSpace(5),
        TitleAndPrice(
          title: "Total",
          price: 50.97,
          style: StylesManager.font23BlckSemiBold,
        ),
      ],
    );
  }
}
