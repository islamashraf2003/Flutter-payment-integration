import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';

// ignore: must_be_immutable
class CustomElevationButton extends StatelessWidget {
  CustomElevationButton(
      {super.key, required this.title, required this.onPressed});
  final String title;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.green,
          fixedSize: Size(300.w, 50.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r))),
      onPressed: onPressed,
      child: Text(
        title,
        style: StylesManager.font22BlckMedium,
      ),
    );
  }
}
