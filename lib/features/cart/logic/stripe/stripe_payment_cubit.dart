import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:payment_integration/features/cart/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/features/cart/data/repos/stripe_repo_impl.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final StripeRepoImpl stripeRepoImpl;

  StripePaymentCubit(Dio dio)
      : stripeRepoImpl = StripeRepoImpl(dio),
        super(StripePaymentInitial());

  Future<void> payWithStripe(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var data = await stripeRepoImpl.checkOutPayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold((error) {
      emit(StripePaymentFailure(errorMessage: error.toString()));
    }, (success) {
      emit(StripePaymentSuccess());
    });
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
