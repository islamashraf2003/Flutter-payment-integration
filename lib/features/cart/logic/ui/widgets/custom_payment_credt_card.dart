import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_integration/core/theming/colors.dart';

// ignore: must_be_immutable
class CustomPaymentCredtCard extends StatefulWidget {
  CustomPaymentCredtCard(
      {super.key, required this.formKey, required this.autovalidateMode});
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode;
  @override
  State<CustomPaymentCredtCard> createState() => _CustomPaymentCredtCardState();
}

class _CustomPaymentCredtCardState extends State<CustomPaymentCredtCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
          isHolderNameVisible: true,
          cardBgColor: ColorsManager.black,
          chipColor: ColorsManager.white,
        ),
        CreditCardForm(
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
        )
      ],
    );
  }
}
