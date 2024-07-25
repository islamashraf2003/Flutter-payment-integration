import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/networking/api_services.dart';
import 'package:payment_integration/features/cart/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_model/payment_intent_model.dart';

/*
PaymentIntentModel create oayment intent(PaymentIntentInputModel); amount | currency | customerId
keySecret createEphemraKey(stripeVersion customerId)
intentPaymentSheet (merchanstDisplayName, intentClientSecret,emphemeralKeySheet)
presemtPaymentSheet()
*/
class StripeServices {
  ApiService stripeServices;
  StripeServices(Dio dio) : stripeServices = ApiService(dio);
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await stripeServices.createPaymentIntent(
        paymentIntentInputModel,
        'Bearer ${ApiKeys.secretkey}',
        Headers.formUrlEncodedContentType,
      );

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

  Future mackPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    if (paymentIntentModel.clientSecret == null) {
      throw Exception('Client Secret is null');
    }

    await intintPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      EphemeralKeyModel eohemeralKeyModel) async {
    try {
      var response = await stripeServices.createEohemeralKey(
        "cus_QXWzr2XUZEVKH9",
        'Bearer ${ApiKeys.secretkey}',
        "2024-06-20",
      );

      return response;
    } on Exception catch (e) {
      log('Error creating payment intent: $e');
      rethrow;
    }
  }
}
//TODO : if exist any error in responce trye to parse to and from json like => var paymentIntent=PaymentIntent.fromJson(responce.toJson());
