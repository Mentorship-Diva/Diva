import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mentorship/core/helpers/dialogs.dart';
import 'package:mentorship/core/theming/colors.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel model) {
    setState(() {
      cardNumber = model.cardNumber;
      expiryDate = model.expiryDate;
      cardHolderName = model.cardHolderName;
      cvvCode = model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }

  void handlePayment() {
    if (formKey.currentState!.validate()) {
      Dialogs.showSuccessDialog(
          context, 'Payment successful , Your order is placed successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              cardBgColor: Colors.black,
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  formKey: formKey,
                  onCreditCardModelChange: onCreditCardModelChange,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cvvCode: cvvCode,
                  cardHolderName: cardHolderName,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pinkColor,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  textStyle: const TextStyle(fontSize: 18),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: handlePayment,
                child: const Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
