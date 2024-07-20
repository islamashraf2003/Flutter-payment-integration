import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDashLine extends StatelessWidget {
  const CustomDashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: List.generate(
          25,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Container(
                height: 1.h,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 153, 152, 152)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
