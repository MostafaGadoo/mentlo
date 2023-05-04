import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mentlo/core/utils/shared_widgets/defaultTextFormField.dart';

class Credit_Card_Widget extends StatefulWidget {
  const Credit_Card_Widget({
    Key? key,
  }) : super(key: key);

  @override
  State<Credit_Card_Widget> createState() => _Credit_Card_WidgetState();
}

class _Credit_Card_WidgetState extends State<Credit_Card_Widget> {

  String cardNumber = '';
  String expiryDate = '';
  String cvvCode = '';
  String cardHolderName = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border = const OutlineInputBorder();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CreditCardWidget(
              cardHolderName: cardHolderName,
              cardBgColor: Colors.black,
              // glassmorphismConfig: Glassmorphism.defaultConfig(),
              textStyle: const TextStyle(color: Colors.yellowAccent),
              width: MediaQuery.of(context).size.width,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cvvCode: cvvCode,
              obscureCardCvv: false,
              showBackView: true,
              onCreditCardWidgetChange: (creditCard) {
                debugPrint('Credit card');
              },
              isChipVisible: true,
              isSwipeGestureEnabled: true,
              animationDuration: const Duration(milliseconds: 1000),
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      onCreditCardModelChange: onCreditCardModelChange,
                      themeColor: Colors.red,
                      formKey: formKey,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  void _onValidate() {
    if (formKey.currentState!.validate()) {
      debugPrint('valid!');
    } else {
      debugPrint('invalid!');
    }
  }
}
