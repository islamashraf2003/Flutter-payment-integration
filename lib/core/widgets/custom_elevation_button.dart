import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';

// ignore: must_be_immutable
class CustomElevationButton extends StatelessWidget {
  CustomElevationButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = ColorsManager.black,
    this.isLoading = false,
  });
  final String title;
  void Function()? onPressed;
  Color? backgroundColor;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(300.w, 50.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r))),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator(
              color: ColorsManager.white,
            )
          : Text(
              title,
              style: StylesManager.font20MediumWhite,
            ),
    );
  }
}
