import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/phonenumber/PhoneVerify.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';
import 'package:food_delivery/screens/forgotpassword/ForgotPasswordAgain.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late ScaffoldMessengerState scaffoldMessenger;
  TextEditingController _emailControlled = new TextEditingController();
  final toastmsg = ToastMsg();
  bool isLoading = false;
  late SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        controller: _emailControlled,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r' ')),
                        ],
                        //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
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

                          if (isValid()) {

                            Constant.isInternetAvailable().then((IsConnected) async {
                              if (IsConnected) {
                                onLoaderShow();
                                ForgotPasswrod(_emailControlled.text.trim());
                                FocusScope.of(context).unfocus();
                              } else {
                                toastmsg.showToast(
                                    Appconfig.network_error, context);
                              }
                            });
                          }
                        },
                        child: Text(
                          'Next',
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
            Visibility(visible: isLoading, child: LoadingIndicator.isLoding()),
          ],

        ),
      ),
    );
  }

  ForgotPasswrod(email) async {
    Map data = {'email': email, 'is_resend': "0"};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.forgot_password),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8")
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Map<String, dynamic>resposne = jsonDecode(response.body);
      if (resposne['success']) {
        Map<String, dynamic>data = resposne['data'];
        toastmsg.showToast("Your otp is: "+"${data['otp']}", context);
        print(" ${data['otp']}");
        initSharePref(data['email']);
        _emailControlled.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PhoneVerify()),);
      }else{
        _emailControlled.clear();
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.red));
      }
      //scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.snak_bg_color));
    }
  }


  @override
  void onLoaderDismiss() {
    // TODO: implement onLoaderDismiss
    setState(() {
      isLoading = false;
    });
  }

  @override
  void onLoaderShow() {
    // TODO: implement onLoaderShow
    setState(() {
      isLoading = true;
    });
  }
  bool isValid() {
    if (_emailControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.email_error, context);
      return false;
    }
    else if (!_emailControlled.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      toastmsg.showToast(AppConstant.email_valid_error, context);
      return false;
    }else {
      return true;
    }
  }
  Future<void> initSharePref(String email) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(Appconfig.email, email);
    print("prefs "+"prefs");
  }
}
