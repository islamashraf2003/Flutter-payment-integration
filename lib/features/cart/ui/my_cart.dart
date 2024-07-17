import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/ui/widgets/custom_card_details.dart';
import 'package:payment_integration/features/cart/ui/widgets/titile_and_price.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_rounded,
          ),
          centerTitle: true,
          title: Text(
            'My Cart',
            style: StylesManager.font25BlckMedium,
          ),
        ),
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
                  title: "Complete Payment", onPressed: () {}),
              verticalSpace(12)
            ],
          ),
        ),
      ),
    );
  }
}
