import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/screens/Address/AddresslistScreen.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/signup/SignUp.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/constant.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneNumberVerify extends StatefulWidget {
  const PhoneNumberVerify({Key? key}) : super(key: key);

  @override
  _PhoneNumberVerifyState createState() => _PhoneNumberVerifyState();
}

class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
  bool _isObscure = true;
  final toastmsg = ToastMsg();
  late SharedPreferences prefs1;
  late ScaffoldMessengerState scaffoldMessenger;
  bool isLoading = false;
  String str_email_id = "",str_otp="",str_phone="";

  TextEditingController otp_controller_1 = new TextEditingController();
  TextEditingController otp_controller_2 = new TextEditingController();
  TextEditingController otp_controller_3 = new TextEditingController();
  TextEditingController otp_controller_4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstant.Login_into_foodly,
          style: TextStyle(
              color: AppColors.font_red,
              fontSize: 21.0,
              fontFamily: 'Poppins SemiBold'),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
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
                    EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Verify Phone Number sent to you at '+str_phone,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 24.0,
                            fontFamily: 'Poppins Medium'),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                    EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
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
                        padding:
                        EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            elevation: 20.0,
                            shadowColor: AppColors.White,
                            child: TextFormField(
                              //autofocus: autoFocus,
                              controller: otp_controller_1,
                              obscureText: _isObscure,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r' ')),
                              ],
                              //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
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
                                    borderSide: BorderSide(
                                        color: AppColors.box_border,
                                        width: 1.0),
                                  ),
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20.0)),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onTap: (){
                                otp_controller_1.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                        EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            elevation: 20.0,
                            shadowColor: AppColors.White,
                            child: TextFormField(
                              //autofocus: autoFocus,
                              controller: otp_controller_2,
                              obscureText: _isObscure,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r' ')),
                              ],
                              //inputFormatters: [UsNumberTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
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
                                    borderSide: BorderSide(
                                        color: AppColors.box_border,
                                        width: 1.0),
                                  ),
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20.0)),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onTap: (){
                                otp_controller_2.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                        EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            elevation: 20.0,
                            shadowColor: AppColors.White,
                            child: TextFormField(
                              //autofocus: autoFocus,
                              controller: otp_controller_3,
                              obscureText: _isObscure,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r' ')),
                              ],
                              //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
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
                                    borderSide: BorderSide(
                                        color: AppColors.box_border,
                                        width: 1.0),
                                  ),
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20.0)),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onTap: (){
                                otp_controller_3.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                        EdgeInsets.only(left: 10.0, top: 50.0, right: 10.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Material(
                            elevation: 20.0,
                            shadowColor: AppColors.White,
                            child: TextFormField(
                              //autofocus: autoFocus,
                              controller: otp_controller_4,
                              obscureText: _isObscure,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r' ')),
                              ],
                              //inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'[a-zA-Z0-9]'))],
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
                                    borderSide: BorderSide(
                                        color: AppColors.box_border,
                                        width: 1.0),
                                  ),
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 20.0)),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onTap: (){
                                otp_controller_4.clear();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0),
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
                                  str_otp = otp_controller_1.text.toString().trim()+otp_controller_2.text.toString().trim()+otp_controller_3.text.toString().trim()+otp_controller_4.text.toString().trim();
                                  VeryfyOTP(str_email_id,str_otp);
                                  FocusScope.of(context).unfocus();
                                } else {
                                  toastmsg.showToast(
                                      Appconfig.network_error, context);
                                }
                              });
                            }
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
                    padding:
                    EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
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
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Constant.isInternetAvailable()
                                      .then((IsConnected) async {
                                    if (IsConnected) {
                                      onLoaderShow();
                                      otp_controller_1.clear();
                                      otp_controller_2.clear();
                                      otp_controller_3.clear();
                                      otp_controller_4.clear();
                                      ResendOTP(str_email_id);
                                      FocusScope.of(context).unfocus();
                                    } else {
                                      toastmsg.showToast(
                                          Appconfig.network_error, context);
                                    }
                                  });
                                },
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
                    padding:
                    EdgeInsets.only(left: 10.0, top: 40.0, right: 10.0),
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
  Future<SharedPreferences> islogedin() async {
    prefs1 = await SharedPreferences.getInstance();
    return prefs1;
  }

  bool isValid() {
    if (otp_controller_1.text.isEmpty) {
      toastmsg.showToast("Please enter your 4 digits code.", context);
      return false;
    } else if (otp_controller_2.text.isEmpty) {
      toastmsg.showToast("Please enter your 4 digits code.", context);
      return false;
    } else if (otp_controller_3.text.isEmpty) {
      toastmsg.showToast("Please enter your 4 digits code.", context);
      return false;
    } else if (otp_controller_4.text.isEmpty) {
      toastmsg.showToast("Please enter your 4 digits code.", context);
      return false;
    } else {
      return true;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogedin().then((it) {
      setState(() {
        str_email_id = it.getString(Appconfig.email)!;
        str_phone = it.getString(Appconfig.phone)!;
        print("str_email_id " + str_email_id);
        print("str_phone " + str_phone);
      });
    });
  }

  ResendOTP(String email) async {
    Map data = {'email': email, 'is_resend': "1"};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.forgot_password),
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
        Map<String, dynamic> data = resposne['data'];
        toastmsg.showToast("Your otp is: " + "${data['otp']}", context);
        print(" ${data['otp']}");
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddresslistScreen()),);
      } else {
        scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("${resposne['message']}"),
            backgroundColor: AppColors.red));
      }
      //scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.snak_bg_color));
    }
  }

  VeryfyOTP(String email,String Otp) async {
    Map data = {'email': email, 'otp': Otp};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.verify_otp),
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
        Map<String, dynamic> data = resposne['data'];
        toastmsg.showToast("${resposne['message']}", context);
        otp_controller_1.clear();
        otp_controller_2.clear();
        otp_controller_3.clear();
        otp_controller_4.clear();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddresslistScreen()),);
      } else {
        otp_controller_1.clear();
        otp_controller_2.clear();
        otp_controller_3.clear();
        otp_controller_4.clear();
        scaffoldMessenger.showSnackBar(SnackBar(
            content: Text("${resposne['message']}"),
            backgroundColor: AppColors.red));
      }
      //scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"),backgroundColor: AppColors.snak_bg_color));
    }
  }
}
