import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/forgotpassword/ForgotPassword.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/introscreen/OnBoardingScreen.dart';
import 'package:food_delivery/screens/signup/SignUp.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:http/http.dart' as http;

import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({Key? key}) : super(key: key);

  @override
  _SignIn_ScreenState createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
  bool _isObscure = true;
  final toastmsg = ToastMsg();

  TextEditingController _PhoneControlled = TextEditingController();
  TextEditingController _passwordControlled = TextEditingController();
  bool isLoading = false;

  late SharedPreferences prefs;

  late ScaffoldMessengerState scaffoldMessenger;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
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
              MaterialPageRoute(builder: (context) => OnBoardingScreen()),
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppConstant.SignIn_Welcome_TXT,
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
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                            text: AppConstant.SignIn_Enter_Email_phone_TXT,
                            style: TextStyle(
                              color: AppColors.font_light_gray,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          TextSpan(
                              text: AppConstant.SignIn_create_new_TXT,
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
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
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        maxLength: 13,
                        controller: _PhoneControlled,
                        style: TextStyle(
                          color: AppColors.font_light_gray,
                          fontSize: 16.0,
                          fontFamily: 'Poppins Regular',
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle:
                              TextStyle(color: AppColors.font_light_gray),
                          //hintText: AppConstant.Email_TXT,
                          suffixIcon:
                              Icon(Icons.phone_android, color: AppColors.red),

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
                        textInputAction: TextInputAction.done,
                        controller: _passwordControlled,
                        obscureText: _isObscure,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r' ')),
                        ],
                        //  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z0-9_\-=@,$,#,%,&,*\.;]+'))],
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
                                  color: AppColors.red),
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
                    padding:
                        EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        child: Text(
                          AppConstant.Forgot_Password_TXT,
                          style: TextStyle(
                            color: AppColors.font_light_gray,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 30.0, top: 50.0, right: 30.0),
                    child: Align(
                      alignment: Alignment.center,
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
                                  login(_PhoneControlled.text.trim(),
                                      _passwordControlled.text.trim());
                                  FocusScope.of(context).unfocus();
                                } else {
                                  toastmsg.showToast(
                                      Appconfig.network_error, context);
                                }
                              });
                            }
                          },
                          child: Text(
                            AppConstant.Sign_In_TXT.toUpperCase(),
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
    if (_PhoneControlled.text.isEmpty) {
      toastmsg.showToast(AppConstant.PhoneNumber_error, context);
      return false;
    } else if (_PhoneControlled.text.length < 10) {
      toastmsg.showToast(AppConstant.PhoneNumber_length_error, context);
      return false;
    } else if (_passwordControlled.text.length < 8) {
      toastmsg.showToast(AppConstant.Password_length_error, context);
      return false;
    } else {
      return true;
    }
  }

/*  getLoginApiData(String email, String password) async {
    Map _params = {
      'email': '$email',
      'password': '$password',
    };
    await http.post(Uri.parse(Appconfig.login), body: _params).then((response) {
      Map<String, dynamic> map = json.decode(response.body.toString());
      print(map);
      List<dynamic> data = map["user"];
      print(data);
      print(data[0]["id"]);
      //  print("response"+json.decode(response.body.toString()));
      Map<String, dynamic> dyData = json.decode(response.body);
      print(dyData);
      LoginResponce.fromJson(dyData);
      var response_new = LoginResponce.fromJson(dyData);
      print("response_new " + response_new.toString());
      if (response_new.msg == "true") {
        print("if " + "if");
        onLoaderDismiss();
        List<LoginUser> userdata = response_new.user;
        userdata.elementAt(0).id;
        userdata.elementAt(0).name;
        userdata.elementAt(0).email;
        user_id= userdata.elementAt(0).id;
        userName= userdata.elementAt(0).name;
        user_email= userdata.elementAt(0).email;
        initSharePref(true);
        Navigator.of(context,rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        print("else " + "else");
        toastmsg.showToast("Please check your username and password.", context);
        onLoaderDismiss();
      }
    }).catchError((e) {
      onLoaderDismiss();
      print(e.toString());
      toastmsg.showToast("Please check your username and password.", context);
      //toastmsg.showToast(e.toString(), context);
    });
  }
  */

  login(phone, password) async {
    Map data = {'mobile_no': phone, 'password': password};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.login),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));
    setState(() {
      isLoading = false;
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (resposne['success']) {
        Map<String, dynamic> user = resposne['user'];
        initSharePref(true, user['id'], user['name'], user['email'], user['mobile_no']);
        _PhoneControlled.clear();
        _passwordControlled.clear();
        Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        print(" ${resposne['message']}");
        _PhoneControlled.clear();
        _passwordControlled.clear();
        scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("${resposne['message']}"),
            backgroundColor: AppColors.red));
      }
      _PhoneControlled.clear();
      _passwordControlled.clear();

    } else {
      _PhoneControlled.clear();
      _passwordControlled.clear();
      scaffoldMessenger.showSnackBar(SnackBar(
          content: Text("Please try again!"), backgroundColor: AppColors.red));
    }
  }

  Future<void> initSharePref(
      bool isLogin, int id, String name, String email, String phone) async {
    prefs = await SharedPreferences.getInstance();
    if (isLogin) {
      prefs.setInt(Appconfig.userid, id);
      prefs.setString(Appconfig.name, name);
      prefs.setString(Appconfig.email, email);
      prefs.setString(Appconfig.phone, phone);
      prefs.setBool(Appconfig.is_login, true);
      //prefs.setBool(Appconfig.ischecked, isChecked);
      print("prefs " + "prefs");
      /* if (isChecked == true) {
        prefs.setString(Appconfig.username, _emailControlled.text);
        prefs.setString(Appconfig.password, _passwordControlled.text);
      } else {
        prefs.setString(Appconfig.username, "");
        prefs.setString(Appconfig.password, "");
      }*/
    }
  }
}
