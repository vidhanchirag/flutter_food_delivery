
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/phonenumber/PhoneVerify.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';

import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late ScaffoldMessengerState scaffoldMessenger;
  TextEditingController _NewPasswordControlled = new TextEditingController();
  TextEditingController _ConfirmPasswordControlled = new TextEditingController();
  final toastmsg = ToastMsg();
  bool isLoading = false;
  bool _isObscure_1 = true;
  bool _isObscure_2 = true;
  String str_email_id="";
  late SharedPreferences prefs1;
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
         'Reset Password',
          style: TextStyle(
            color: AppColors.font_red,
            fontSize: 21.0,
            fontFamily: 'Poppins SemiBold',
          ),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PhoneVerify()),
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
                      'Reset Password',
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
                  color: AppColors.input_color,
                  padding: EdgeInsets.only(left: 20.0,top: 30.0,right: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _NewPasswordControlled,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r' ')),
                        ],
                        //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z0-9_\-=@,$,#,%,&,*\.;]+'))],
                        obscureText: _isObscure_1,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: TextStyle(color: AppColors.font_light_gray),
                          //hintText: AppConstant.Email_TXT,
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure_1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.red),
                              onPressed: () {
                                setState(() {
                                  _isObscure_1 = !_isObscure_1;
                                });
                              }),

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
                        controller: _ConfirmPasswordControlled,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r' ')),
                        ],
                       // inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z0-9_\-=@,$,#,%,&,*\.;]+'))],
                        obscureText: _isObscure_2,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: AppColors.font_light_gray),
                          //hintText: AppConstant.Email_TXT,
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure_2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.red),
                              onPressed: () {
                                setState(() {
                                  _isObscure_2 = !_isObscure_2;
                                });
                              }),

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
                               ResetPassword(str_email_id,_NewPasswordControlled.text.trim(),_ConfirmPasswordControlled.text.toString().trim());
                                FocusScope.of(context).unfocus();
                              } else {
                                toastmsg.showToast(
                                    Appconfig.network_error, context);
                              }
                            });
                          }
                        },
                        child: Text(
                          'Reset Password',
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
    if (_NewPasswordControlled.text.isEmpty) {
      toastmsg.showToast('Please enter your new password.', context);
      return false;
    } else if (_NewPasswordControlled.text.length < 8) {
      toastmsg.showToast(AppConstant.Password_length_error, context);
      return false;
    } else if (_ConfirmPasswordControlled.text.isEmpty) {
      toastmsg.showToast('Please enter your confirm password.', context);
      return false;
    } else if (_ConfirmPasswordControlled.text.length < 8) {
      toastmsg.showToast(AppConstant.Password_length_error, context);
      return false;
    }  else {
      return true;
    }
  }
  Future<SharedPreferences> islogedin() async {
    prefs1 = await SharedPreferences.getInstance();
    return prefs1;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogedin().then((it) {
      setState(() {
        str_email_id = it.getString(Appconfig.email)!;
        print("str_email_id " + str_email_id);
      });
    });
  }

  ResetPassword(String email,String NPassword,String CPassword) async {
    Map data = {'email': email, 'new_password': NPassword,'confirm_password': CPassword};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.change_password),
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
        toastmsg.showToast("${resposne['message']}", context);
        _NewPasswordControlled.clear();
        _ConfirmPasswordControlled.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn_Screen()),);
      }else{
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.red));
      }
      //scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.snak_bg_color));
    }
  }
}
