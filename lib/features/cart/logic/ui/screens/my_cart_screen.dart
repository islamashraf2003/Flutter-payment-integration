import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/widgets/build_appbar.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/logic/ui/screens/payment_details_screen.dart';
import 'package:payment_integration/features/cart/logic/ui/widgets/custom_card_details.dart';
import 'package:payment_integration/features/cart/logic/ui/widgets/payment_items_buttom_sheet.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("My Cart"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(10),
            Expanded(
                child: Center(
                    child: Image.asset("assets/images/basket_images.png"))),
            verticalSpace(20),
            const CustomCardDetails(),
            verticalSpace(10),
            CustomElevationButton(
                title: "Complete Payment",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PaymentItemsBottomSheet();
                    },
                  );
                }),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
