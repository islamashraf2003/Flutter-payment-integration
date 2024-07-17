import 'package:flutter/material.dart';
import 'package:payment_integration/features/cart/ui/my_cart.dart';

void main() {
  runApp(const MyCart());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'payment integration',
      home: MyCart(),
    );
  }
}
