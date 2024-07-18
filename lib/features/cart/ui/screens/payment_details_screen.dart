import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/widgets/builf_appbar.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_item.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_items_list.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Payment Details"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            PaymentItemsList(),
          ],
        ),
      ),
    );
  }
}
