import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/features/cart/logic/payment_type/payment_type_cubit.dart';
import 'package:payment_integration/features/cart/ui/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_integration/features/cart/ui/widgets/payment_items_list.dart';

class PaymentItemsBottomSheet extends StatelessWidget {
  const PaymentItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentTypeCubit(),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PaymentItemsListView(),
            verticalSpace(24),
            const CustomButtonBlocConsumer(),
          ],
        ),
      ),
    );
  }
}
