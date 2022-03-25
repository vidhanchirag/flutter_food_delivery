import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';
import 'package:food_delivery/screens/phonenumber/PhoneVerify.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  TextEditingController _nameControlled = TextEditingController();
  TextEditingController _emailControlled = TextEditingController();
  TextEditingController _phoneNumberControlled = TextEditingController();
  TextEditingController _passwordControlled = TextEditingController();
  TextEditingController _addressControlled = TextEditingController();
  bool isLoading = false;
  late SharedPreferences prefs;
  late ScaffoldMessengerState scaffoldMessenger;
  final toastmsg = ToastMsg();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Account',
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
              MaterialPageRoute(builder: (context) => SignIn_Screen()),
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
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppConstant.Create_Account,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24.0,
                          fontFamily: 'Poppins Medium',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text: AppConstant.Create_txt,
                            style: TextStyle(
                              color: AppColors.font_light_gray,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          TextSpan(
                              text: AppConstant.Have_Account,
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn_Screen()),
                                  );
                                },
                              style: TextStyle(
                                color: AppColors.font_green,
                                fontFamily: 'Poppins Bold',
                                fontSize: 16.0,
                              )),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.input_color,
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: _nameControlled,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: AppConstant.Full_Name,
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          //hintText: AppConstant.Full_Name,

                          //  hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.red[500],
                            fontSize: 15.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),

                          /* border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)),*/
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.input_color,
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _emailControlled,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: AppConstant.Email_TXT,
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          // hintText: AppConstant.Email_TXT,

                          //  hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.red[500],
                            fontSize: 15.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),

                          /* border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)),*/
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.input_color,
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        controller: _phoneNumberControlled,
                        maxLength: 10,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: AppConstant.Phone_Number,
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          //hintText: AppConstant.Phone_Number,
                          //  hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.red[500],
                            fontSize: 15.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),

                          /* border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)),*/
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.input_color,
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: _passwordControlled,
                        obscureText: _isObscure,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: AppConstant.Password_TXT,
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          // hintText: AppConstant.Password_TXT,
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.font_light_gray),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          //  hintStyle: TextStyle(color: Colors.white),
                          errorStyle: TextStyle(
                            color: Colors.red[500],
                            fontSize: 15.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          /* border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)),*/
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.input_color,
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    height: 136,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        maxLines: 6,
                        cursorColor: AppColors.font_light_gray,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.left,
                        controller: _addressControlled,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: AppConstant.Address,
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          errorStyle: TextStyle(
                            color: Colors.red[500],
                            fontSize: 15.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.box_border, width: 1.0),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          /* border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0)),*/
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0),
                    child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isValid()) {
                            Constant.isInternetAvailable()
                                .then((IsConnected) async {
                              if (IsConnected) {
                               onLoaderShow();
                                register(
                                  _emailControlled.text.trim(),
                                  _passwordControlled.text.trim(),
                                  _nameControlled.text.trim(),
                                  _phoneNumberControlled.text.trim(),
                                  _addressControlled.text.trim(),
                                );
                                FocusScope.of(context).unfocus();
                              } else {
                                toastmsg.showToast(
                                    Appconfig.network_error, context);
                              }
                            });
                          }
                        },
                        child: Text(
                          AppConstant.Sign_Up.toUpperCase(),
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
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
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

  register(email, password, name, mobile_no, address) async {
    Map data = {'email': email, 'password': password, 'c_password': password, 'name': name, 'mobile_no': mobile_no, 'address': address};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.register),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    setState(() {
      isLoading = false;
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (resposne['success']) {
        Map<String, dynamic> user = resposne['user'];
        initSharePref(true, user['id'], user['name'], user['email']);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneVerify()),);
      } else {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.red));
      }
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.snak_bg_color));
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Please try again!"), backgroundColor: AppColors.red));
    }
  }

  Future<void> initSharePref(
      bool isLogin, int id, String name, String email) async {
    prefs = await SharedPreferences.getInstance();
    if (isLogin) {
      prefs.setInt(Appconfig.userid, id);
      prefs.setString(Appconfig.name, name);
      prefs.setString(Appconfig.email, email);
      prefs.setBool(Appconfig.is_login, true);
    }
  }

  bool isValid() {
    if (_nameControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.Username_error, context);
      return false;
    } else if (_emailControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.email_error, context);
      return false;
    } else if (!_emailControlled.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      toastmsg.showToast(AppConstant.email_valid_error, context);
      return false;
    } else if (_phoneNumberControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.PhoneNumber_error, context);
      return false;
    } else if (_phoneNumberControlled.text.length<10) {
      toastmsg.showToast(AppConstant.PhoneNumber_lenght_error, context);
      return false;
    } else if (_passwordControlled.text.length < 8) {
      toastmsg.showToast(AppConstant.Password_length_error, context);
      return false;
    } else if (_addressControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.address_error, context);
      return false;
    } else {
      return true;
    }
  }
}
