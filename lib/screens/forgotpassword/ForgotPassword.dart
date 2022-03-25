import 'package:flutter/material.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';
import 'package:food_delivery/screens/forgotpassword/ForgotPasswordAgain.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn_Screen()),
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
                  AppConstant.Forgot_PasswordTXT,
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
                child: Text(
                  AppConstant.Email_lbl_Txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.font_light_gray,
                    fontSize: 16.0,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ),
            Container(
              color: AppColors.input_color,
              padding: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: AppConstant.Email_TXT,
                      labelStyle: TextStyle(color: AppColors.font_light_gray),
                      //hintText: AppConstant.Email_TXT,
                      suffixIcon: Icon(Icons.email, color: AppColors.red),

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0,top: 50.0,right: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ForgotPasswordAgain()),
                      );
                    },
                    child: Text(
                      AppConstant.reset_link.toUpperCase(),
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
