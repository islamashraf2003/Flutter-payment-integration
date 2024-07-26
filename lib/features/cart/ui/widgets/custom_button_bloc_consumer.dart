import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/widgets/custom_elevation_button.dart';
import 'package:payment_integration/features/cart/data/models/paybal_model/amount_model/amount_model.dart';
import 'package:payment_integration/features/cart/data/models/paybal_model/amount_model/details.dart';
import 'package:payment_integration/features/cart/data/models/paybal_model/items_list_model/item.dart';
import 'package:payment_integration/features/cart/data/models/paybal_model/items_list_model/items_list_model.dart';
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
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomElevationButton(
          title: "Conteniue",
          onPressed: () {
            //-------------Stripe payment---------
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: "${200 * 100}",
            //   currency: "USD",
            //   customerId: "cus_QXWbEV4hGteQpJ",
            // );
            // BlocProvider.of<StripePaymentCubit>(context).payWithStripe(
            //     paymentIntentInputModel: paymentIntentInputModel);

            //-----------------Paybal------------
            var paybalTranscationData = getPaybalTransactionData();
            executePaybalPayment(context, paybalTranscationData);
          },
          isLoading: state is StripePaymentLoading ? true : false,
        );
      },
    );
  }

  void executePaybalPayment(BuildContext context,
      ({AmountModel amount, ItemsListModel itemsList}) paybalTranscationData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paybalClientId,
          secretKey: ApiKeys.paybalSecretKey,
          transactions: [
            {
              "amount": paybalTranscationData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": paybalTranscationData.itemsList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThankYouScreen(),
                ));
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  //record data type
  ({AmountModel amount, ItemsListModel itemsList}) getPaybalTransactionData() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
    );
    List<Item> items = [
      Item(currency: "USD", price: "4", quantity: 10, name: "Apple"),
      Item(currency: "USD", price: "5", quantity: 12, name: "Apple"),
    ];
    var itemsList = ItemsListModel(items: items);
    return (amount: amount, itemsList: itemsList);
  }
}
