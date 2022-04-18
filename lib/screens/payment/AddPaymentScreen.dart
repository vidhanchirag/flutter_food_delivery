import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/orders/OrderDetailScreen.dart';
import 'package:food_delivery/screens/orders/YourOrderScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:flutter/cupertino.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentScreenState createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey;
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            color: AppColors.font_red,
            fontSize: 21.0,
            fontFamily: 'Poppins SemiBold',
          ),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => YuorOrderScreen()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 20.0,top: 40.0,right: 20.0),
                child: Text(
                  'Add your payment methods',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.0,
                    fontFamily: 'Poppins SemiBold',
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 30.0,top: 10.0,right: 30.0),
                child: Text(
                  'This card will only be charged when you place an order.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.font_light_gray,
                    fontSize: 16.0,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ),
            Container(
              child:   CreditCardForm(
                formKey: formKey, // Required
                onCreditCardModelChange: (CreditCardModel data) {}, // Required
                themeColor: Colors.red,
                obscureCvv: true,
                obscureNumber: true,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardNumberDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                  hintStyle: TextStyle(fontSize: 16.0, color:AppColors.font_light_gray,fontFamily:'Poppins Regular' ),
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expired Date',
                  hintStyle: TextStyle(fontSize: 16.0, color:AppColors.font_light_gray,fontFamily:'Poppins Regular' ),
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                  hintStyle: TextStyle(fontSize: 16.0, color:AppColors.font_light_gray,fontFamily:'Poppins Regular' ),
                  hintText: 'XXX',
                ),
                cardHolderDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontSize: 16.0, color:AppColors.font_light_gray,fontFamily:'Poppins Regular' ),
                  labelText: 'Card Holder',
                ), cvvCode: '', cardHolderName: '', cardNumber: '', expiryDate: '',
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 50.0,right: 20.0,bottom: 30),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: Text(
                      'Add Card'.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.White,
                        fontSize: 14.0,
                        fontFamily: 'Poppins Bold',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        primary: AppColors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OrderDetailsScreen()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Online Delivery"),
    content: Text("You Place the Order Successfully"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}