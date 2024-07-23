/*
TODO: paymentIntentObject create intent(amount,currency)

TODO: init paymennt sheet (paymentIntentClinetSecret)

TODO: presentPayment
*/
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:retrofit/http.dart';
part 'stripe_services.g.dart';

@RestApi(baseUrl: 'https://api.stripe.com/v1/')
abstract class StripeServices {
  factory StripeServices(Dio dio, {String baseUrl}) = _StripeServices;
  @POST('/payment_intents')
  Future<PaymentIntentModel> createPaymentIntent(
    @Body() PaymentIntentInputModel paymentIntentInputModelP,
    @Header('Authorization') String token,
    @Header('Content-Type') String contentType,
  );
}
//content type ==> application/x-www-form-urle coded