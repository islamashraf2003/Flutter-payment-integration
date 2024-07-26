import 'package:bloc/bloc.dart';

class PaymentTypeCubit extends Cubit<int> {
  PaymentTypeCubit() : super(0);
  void selectPaymentType(int index) {
    emit(index);
  }
}
