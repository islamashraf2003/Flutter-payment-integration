import 'package:dio/dio.dart';
import 'package:payment_integration/features/cart/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: 'https://api.stripe.com/v1/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST('payment_intents')
  Future<PaymentIntentModel> createPaymentIntent(
    @Body() PaymentIntentInputModel paymentIntentInputModelP,
    @Header('Authorization') String token,
    @Header('Content-Type') String contentType,
  );
  // Create an Ephemeral Key for the Customer
  @POST('ephemeral_keys')
  Future<EphemeralKeyModel> createEohemeralKey(
    String customerId,
    @Header('Authorization') String token,
    @Header('Stripe-Version') String stripeVersion,
  );
}
