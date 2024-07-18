import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/widgets/builf_appbar.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/ui/screens/payment_details_screen.dart';
import 'package:payment_integration/features/cart/ui/widgets/custom_card_details.dart';

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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PaymentDetailsScreen(),
                  ));
                }),
            verticalSpace(12)
          ],
        ),
      ),
    );
  }
}
