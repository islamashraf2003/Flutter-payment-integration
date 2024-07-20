import 'package:flutter/material.dart';
import 'package:payment_integration/core/theming/styles.dart';

class ThankYouItem extends StatelessWidget {
  const ThankYouItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: StylesManager.font18BlckRegular,
        ),
        Text(
          value,
          style: StylesManager.font16BlckBold,
        ),
      ],
    );
  }
}
