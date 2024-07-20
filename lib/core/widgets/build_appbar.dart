import 'package:flutter/material.dart';
import 'package:payment_integration/core/theming/styles.dart';

AppBar buildAppBar(String? title) {
  return AppBar(
    leading: const Icon(
      Icons.arrow_back_rounded,
    ),
    centerTitle: true,
    title: Text(
      title ?? "",
      style: StylesManager.font23BlckMedium,
    ),
  );
}
