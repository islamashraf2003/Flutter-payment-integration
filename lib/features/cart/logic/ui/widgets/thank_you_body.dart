import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_integration/core/helper/spacer.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/core/theming/styles.dart';
import 'package:payment_integration/features/cart/logic/ui/widgets/masterd_card_widget.dart';
import 'package:payment_integration/features/cart/logic/ui/widgets/thank_you_item.dart';
import 'package:payment_integration/features/cart/logic/ui/widgets/titile_and_price.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(60),
          Text(
            "Thank you!",
            style: StylesManager.font22BlckMediumBlck,
          ),
          verticalSpace(5),
          Text(
            "Your transaction was successful",
            style: StylesManager.font16RegularBlack,
          ),
          verticalSpace(18),
          const ThankYouItem(
            title: "Date",
            value: "07/20/2024",
          ),
          verticalSpace(10),
          const ThankYouItem(
            title: "Time",
            value: "10:15 AM",
          ),
          verticalSpace(10),
          const ThankYouItem(
            title: "To",
            value: "mazen",
          ),
          Divider(
            height: 40.h,
            thickness: 1.2.w,
          ),
          TitleAndPrice(
            title: "Total",
            price: 50.97,
            style: StylesManager.font23BlckSemiBold,
          ),
          verticalSpace(20),
          Container(
            width: double.infinity,
            height: 65.h,
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: const MasterdCardWidget(),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.barcode,
                size: 60.w,
              ),
              Container(
                width: 113.w,
                height: 58.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5.w,
                      color: ColorsManager.green,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "PAID",
                    style: StylesManager.font23BlckMedium
                        .copyWith(color: ColorsManager.green),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (165.h / 2) - 30.h,
          ),
        ],
      ),
    );
  }
}
