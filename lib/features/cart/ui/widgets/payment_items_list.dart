import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_item.dart';

class PaymentItemsList extends StatefulWidget {
  const PaymentItemsList({super.key});

  @override
  State<PaymentItemsList> createState() => _PaymentItemsListState();
}

class _PaymentItemsListState extends State<PaymentItemsList> {
  List<String> paymentTypeImages = [
    "assets/images/card_payment_image.svg",
    "assets/images/paybal_image.svg"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentTypeImages.length,
        itemBuilder: (context, index) {
          return PaymentItem(
            image: paymentTypeImages[index],
            isActive: index == activeIndex,
            onTap: () {
              setState(
                () {
                  activeIndex = index;
                },
              );
            },
          );
        },
      ),
    );
  }
}
