import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_integration/core/theming/colors.dart';

// ignore: must_be_immutable
class PaymentItem extends StatelessWidget {
  PaymentItem(
      {super.key, required this.image, this.isActive = false, this.onTap});
  String image;
  bool isActive;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          child: Container(
            width: 140.w,
            height: 70.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: isActive ? ColorsManager.green : ColorsManager.gray,
                  width: 1.3.w,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              shadows: [
                BoxShadow(
                  color: isActive ? ColorsManager.green : ColorsManager.white,
                  blurRadius: 4.r,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: SvgPicture.asset(
                  image,
                  height: 20.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
