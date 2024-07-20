import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/ui/screens/payment_details_screen.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_items_list.dart';

class PaymentItemsBottomSheet extends StatelessWidget {
  const PaymentItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentItemsListView(),
          verticalSpace(24),
          CustomElevationButton(
            title: "Conteniue",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PaymentDetailsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
