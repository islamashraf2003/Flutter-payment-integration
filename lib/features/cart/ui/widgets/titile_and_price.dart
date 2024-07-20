import 'package:flutter/material.dart';
import 'package:payment_integration/core/theming/styles.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    super.key,
    required this.title,
    required this.price,
    this.style,
  });

  final String title;
  final double price;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? StylesManager.font18BlckRegular;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: effectiveStyle,
            ),
            Text(
              "\$$price",
              style: effectiveStyle,
            ),
          ],
        ),
      ],
    );
  }
}
