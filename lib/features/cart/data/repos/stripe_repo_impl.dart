import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/networking/api_services.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_model/payment_intent_model.dart';

/*
TODO: paymentIntentObject create intent(amount,currency)

TODO: init paymennt sheet (paymentIntentClinetSecret)

TODO: presentPayment
*/
class StripeRepoImpl {
  ApiService stripeServices;
  StripeRepoImpl(Dio dio) : stripeServices = ApiService(dio);
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await stripeServices.createPaymentIntent(
          paymentIntentInputModel.PaymentIntentInputModelToJson(),
          'Bearer ${ApiKeys.secretkey}',
          "application/x-www-form-urlencoded");

      return response;
    } on Exception catch (e) {
      log('Error creating payment intent: $e');
      rethrow;
    }
  }

  Future intintPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "islam",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
}
//TODO : if exist any error in responce trye to parse to and from json like => var paymentIntent=PaymentIntent.fromJson(responce.toJson()); 