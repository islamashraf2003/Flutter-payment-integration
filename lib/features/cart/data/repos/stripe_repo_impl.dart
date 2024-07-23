import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:payment_integration/core/networking/api_keys.dart';
import 'package:payment_integration/core/payment/stripe_services.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_model/payment_intent_model.dart';

class StripeRepoImpl {
  StripeServices stripeServices;
  StripeRepoImpl(Dio dio) : stripeServices = StripeServices(dio);
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var responce = await stripeServices.createPaymentIntent(
          paymentIntentInputModel.PaymentIntentInputModelToJson(),
          'Bearer ${ApiKeys.secretkey}',
          "application/x-www-form-urlencoded");

      return responce;
    } on Exception catch (e) {
      log('Error creating payment intent: $e');
      rethrow;
    }
  }
}
//TODO : if exist any error in responce trye to parse to and from json like => var paymentIntent=PaymentIntent.fromJson(responce.toJson()); 