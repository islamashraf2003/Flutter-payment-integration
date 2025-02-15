import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/widgets/build_appbar.dart';
import 'package:payment_integration/features/cart/ui/widgets/check_widget.dart';
import 'package:payment_integration/features/cart/ui/widgets/custom_dash_line.dart';
import 'package:payment_integration/features/cart/ui/widgets/thank_you_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("", context),
      backgroundColor: ColorsManager.white,
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h, top: 35.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.lightGray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ThankYouBody(),
            ),
            Positioned(
              left: -20.w,
              bottom: 150.h,
              child: const CircleAvatar(
                backgroundColor: ColorsManager.white,
              ),
            ),
            Positioned(
              right: -20.w,
              bottom: 150.h,
              child: const CircleAvatar(
                backgroundColor: ColorsManager.white,
              ),
            ),
            const CheckWidget(),
            Positioned(
              bottom: 165.h,
              left: 0,
              right: 0,
              child: const CustomDashLine(),
            ),
          ],
        ),
      ),
    );
  }
}
