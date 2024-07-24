import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';

// ignore: must_be_immutable
class CustomElevationButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool isLoading;

  const CustomElevationButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = ColorsManager.black,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(300.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.white,
              ),
            )
          : Text(
              title,
              style: StylesManager.font20MediumWhite,
            ),
    );
  }
}
