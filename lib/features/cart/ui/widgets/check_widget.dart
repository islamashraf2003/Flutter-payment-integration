import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/colors.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.w,
      right: 0.w,
      top: -35.h,
      child: CircleAvatar(
        maxRadius: 40.r,
        backgroundColor: ColorsManager.gray,
        child: CircleAvatar(
          maxRadius: 30.r,
          backgroundColor: ColorsManager.green,
          child: Icon(
            Icons.check_sharp,
            color: ColorsManager.white,
            size: 50.r,
          ),
        ),
      ),
    );
  }
}
