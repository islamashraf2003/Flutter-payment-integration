import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/features/cart/logic/payment_type/payment_type_cubit.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_item.dart';

class PaymentItemsListView extends StatefulWidget {
  const PaymentItemsListView({super.key});

  @override
  State<PaymentItemsListView> createState() => _PaymentItemsListViewState();
}

class _PaymentItemsListViewState extends State<PaymentItemsListView> {
  List<String> paymentTypeImages = [
    "assets/images/card_payment_image.svg",
    "assets/images/paybal_image.svg"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        height: 70.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentTypeImages.length,
          itemBuilder: (context, index) {
            return PaymentItem(
              image: paymentTypeImages[index],
              isActive: index == activeIndex,
              onTap: () {
                setState(
                  () {
                    activeIndex = index;
                    context
                        .read<PaymentTypeCubit>()
                        .selectPaymentType(activeIndex);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
