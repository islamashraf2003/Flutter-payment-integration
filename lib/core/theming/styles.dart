import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/theming/font_weight_manager.dart';

abstract class StylesManager {
  static TextStyle font18BlckRegular = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle font16BlckBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle font23BlckMedium = TextStyle(
    fontSize: 23.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.medium,
  );
  static TextStyle font23BlckSemiBold = TextStyle(
    fontSize: 23.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle font22BlckMediumBlck = TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle font20MediumWhite = TextStyle(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeightManager.semiBold,
  );
  static TextStyle font16RegularBlack = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeightManager.regular,
  );
}
