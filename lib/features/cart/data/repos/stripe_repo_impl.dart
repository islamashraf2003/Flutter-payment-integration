import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_integration/core/helper/failure.dart';
import 'package:payment_integration/core/payment/stripe_services.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';

class StripeRepoImpl {
  StripeServices stripeServices;
  StripeRepoImpl(Dio dio) : stripeServices = StripeServices(dio);

  Future<Either<Failure, void>> checkOutPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.mackPayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
