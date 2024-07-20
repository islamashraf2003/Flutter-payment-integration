import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/theming/styles.dart';

class MasterdCardWidget extends StatelessWidget {
  const MasterdCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              "assets/images/masterd_card_image.svg",
              width: 40.w,
              height: 30.h,
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Credit Card",
                    style: StylesManager.font18BlckRegular,
                  ),
                  verticalSpace(4),
                  const Text("Mastercard **78"),
                ],
              )),
        ],
      ),
    );
  }
}
