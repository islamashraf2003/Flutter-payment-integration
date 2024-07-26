import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/theming/colors.dart';
import 'package:payment_integration/features/cart/ui/screens/my_cart_screen.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorsManager.white,
          appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.white),
          scaffoldBackgroundColor: ColorsManager.white,
        ),
        debugShowCheckedModeBanner: false,
        title: 'payment integration',
        home: const MyCartScreen(),
      ),
    );
  }
}
