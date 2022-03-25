import 'package:flutter/material.dart';
import 'package:food_delivery/screens/forgotpassword/ForgotPassword.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';



class ForgotPasswordAgain extends StatefulWidget {
  const ForgotPasswordAgain({Key? key}) : super(key: key);

  @override
  _ForgotPasswordAgainState createState() => _ForgotPasswordAgainState();
}

class _ForgotPasswordAgainState extends State<ForgotPasswordAgain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstant.Forgot_PasswordTXT,
          style: TextStyle(
            color: AppColors.font_red,
            fontSize: 21.0,
            fontFamily: 'Poppins SemiBold',
          ),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPassword()),
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
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 50.0,right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppConstant.reset_email_sent,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontFamily: 'Poppins Medium',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                      text: AppConstant.Email_reset_lbl_Txt,
                      style: TextStyle(
                        color: AppColors.font_light_gray,
                        fontSize: 16.0,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                    TextSpan(
                        text: AppConstant.having_lbl_Txt,
                        style: TextStyle(
                          color: AppColors.red,
                          fontFamily: 'Poppins Bold',
                          fontSize: 17.0,
                        )),
                  ]),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 30.0,top: 50.0,right: 30.0),
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn_Screen()),
                    );
                  },
                  child: Text(
                    AppConstant.sent_again.toUpperCase(),
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
          ],
        ),
      ),
    );
  }
}
