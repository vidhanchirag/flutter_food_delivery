import 'package:flutter/material.dart';
import 'package:food_delivery/screens/findrestaurant/FindRestaurantsScreen.dart';
import 'package:food_delivery/screens/signup/SignUp.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({Key? key}) : super(key: key);

  @override
  _PhoneVerifyState createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstant.Login_into_foodly,
          style: TextStyle(
            color: AppColors.font_red,
            fontSize: 21.0,
              fontFamily: 'Poppins SemiBold'
          ),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()),
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
              padding: EdgeInsets.only(left: 10.0,top: 50.0,right: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppConstant.Verify_phone_number,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.0,
                      fontFamily: 'Poppins Medium'
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 20.0,right: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppConstant.Enter_4_digit_Txt,
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: AppColors.font_light_gray,
                    fontSize: 16.0,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0,top: 50.0,right: 10.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      elevation: 20.0,
                      shadowColor: AppColors.White,
                      child: TextFormField(
                        //autofocus: autoFocus,
                        obscureText: _isObscure,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 17.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        //controller: controller,
                        maxLength: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                            ),
                            counterText: '',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0,top: 50.0,right: 10.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      elevation: 20.0,
                      shadowColor: AppColors.White,
                      child: TextFormField(
                        //autofocus: autoFocus,
                        obscureText: _isObscure,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        //controller: controller,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 17.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        maxLength: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                            ),
                            counterText: '',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0,top: 50.0,right: 10.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      elevation: 20.0,
                      shadowColor: AppColors.White,
                      child: TextFormField(
                        //autofocus: autoFocus,
                        obscureText: _isObscure,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        //controller: controller,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 17.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        maxLength: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                            ),
                            counterText: '',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0,top: 50.0,right: 10.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Material(
                      elevation: 20.0,
                      shadowColor: AppColors.White,
                      child: TextFormField(
                        //autofocus: autoFocus,
                        obscureText: _isObscure,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        //controller: controller,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 17.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        maxLength: 1,
                        cursorColor: Theme.of(context).primaryColor,

                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                            ),
                            counterText: '',
                            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0,top: 40.0,right: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FindRestaurantsScreen()),
                      );
                    },
                    child: Text(
                      AppConstant.Continue_TXT.toUpperCase(),
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
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: [
                    TextSpan(
                      text: AppConstant.Didnt_recieve_Txt,
                      style: TextStyle(
                        color: AppColors.font_light_gray,
                        fontSize: 12.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                    TextSpan(
                        text: AppConstant.Resend_again,
                        style: TextStyle(
                          color: AppColors.red,
                          fontFamily: 'Poppins Medium',
                          fontSize: 12.0,
                        )),
                  ]),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0,top: 40.0,right: 10.0),
              child: Text(
                AppConstant.by_signing,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.font_light_gray,
                  fontSize: 16.0,
                  fontFamily: 'Poppins Regular',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
