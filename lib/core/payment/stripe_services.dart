import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/networking/api_services.dart';
import 'package:payment_integration/features/cart/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_integration/features/cart/data/models/init_payment_sheet_input_model.dart';
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
        'Bearer ${ApiKeys.stripeSecretkey}',
        Headers.formUrlEncodedContentType,
      );
      return response;
    } on Exception catch (e) {
      log('Error creating payment intent: $e');
      rethrow;
    }
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKeySecret,
        customerId: initPaymentSheetModel.customerId,
        merchantDisplayName: "islam",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId!);
    var initPaymentSheetModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: paymentIntentInputModel.customerId);
    if (paymentIntentModel.clientSecret == null) {
      throw Exception('Client Secret is null');
    }

    await initPaymentSheet(
      initPaymentSheetModel: initPaymentSheetModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    try {
      var response = await stripeServices.createEphemeralKey(
        customerId,
        'Bearer ${ApiKeys.stripeSecretkey}',
        '2024-06-20',
      );
      return response;
    } on Exception catch (e) {
      log('Error creating ephemeral key: $e');
      rethrow;
    }
  }
}
