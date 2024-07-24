import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/logic/stripe/stripe_payment_cubit.dart';
import 'package:payment_integration/features/cart/ui/screens/thank_you_screen.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouScreen(),
            ),
          );
        }
        if (state is StripePaymentFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomElevationButton(
          title: "Conteniue",
          onPressed: () {},
          isLoading: state is StripePaymentLoading ? true : false,
        );
      },
    );
  }
}
