import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:food_delivery/utils/AppColors.dart';



class AppConstant {
  static const String EMAIL_PATTER = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
      "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})";

  /* static const String ALLREADY_ACCOUNT = "Already have an account?";
  static const String LOGIN_IN_SIGNUP = "LogIn";
  static const String NOINTERNETCONNECTION = "No internet connection ";
  static const String USER_NAME_VALIDATION = "Please enter  username";
  static const String PASSWORD_VALIDATION = "Please enter password";
  static const String LOGIN_FORGOTPASSWORD = 'Forgot Password?';
  static const String LOGIN_DONT_ACCOUNT = "Don't have an account?";
  static const String LOGIN_SIGNUP = "Sign Up";
  static const String I_AGREE_WITH = "I agree with";
  static const String TERMS_AND_CONDITION = "terms & conditions";
  static const String API_KEY = "0499199137017434952747394.u1lm0rfqzoft0e2";
  static const String LOGINDATA_MODAL = "logindatamodal";
  static const String ISLOGIN = "isLogin";*/

  /*--------------GENERAL Strings--------------*/
  
  static const String BACK_TXT = "Back";
  static const String SAVE_TXT = "Save";
  static const String SEARCH_TXT = "Search";
  static const String RESET_TXT = "Reset";
  static const String CANCEL_TXT = "Cancel";
  static const String CLOSE_TXT = "Close";
  static const String Next_TXT = "Next";
  static const String Continue_TXT = "Continue";
  static const String Resend_again = " Resend Again";
  static const String Get_Started_TXT = " Get Started";

  /******************************** SignUp screen ******************************/
  static const String Create_Account = "Create Account";
  static const String Have_Account = "Already have account?";
  static const String Full_Name = "Full Name";
  static const String Phone_Number = "Phone Number";
  static const String Sign_Up = "Sign Up";
  static const String Address = "Address";
  static const String Create_txt = "Enter your Name,Email and Password\nfor sign up.";
  static const String by_signing = "By signing up you agree to our Terms\nConditions & Privacy Policy.";



  /******************************** Login screen ******************************/

  static const String Login_TXT = "Login";
  static const String UserName_TXT = "UserName";
  static const String Password_TXT = "Password";
  static const String Remember_me_TXT = "Remember me";
  static const String Forgot_Password_TXT = "Forgot Password?";
  static const String Sign_In_TXT = "Sign In";

  static const String Username_error = "Please enter full name.";
  static const String email_error = "Please enter email address.";
  static const String email_valid_error = "Please enter valid email address.";
  static const String UserPassword_error = "Please enter password.";
  static const String PhoneNumber_error = "Please enter phone number.";
  static const String PhoneNumber_lenght_error = "Phone number must be at least 10 digits";
  static const String address_error = "Please enter address.";
  static const String Password_length_error = "Enter password 8+ characters.";
  static const String  PhoneNumber_length_error = "Enter 10+ digits as a phone number.";

  /******************************** ChangePassword screen ******************************/

  static const String Change_Password_TXT = "Change Password";
  static const String Current_Password_TXT = "Current Password";
  static const String New_Password_TXT = "New Password";
  static const String Confirm_Password_TXT = "Confirm Password";
  static const String Submit_TXT = "Submit";

  static const String current_pasword_error = "Enter current password.";
  static const String new_pasword_error = "Enter new password.";
  static const String confirm_pasword_error = "Enter confirm password.";

  /******************************** Forgot Password screen ******************************/

  static const String Forgot_PasswordTXT = "Forgot Password";
  static const String Email_TXT = "Email";
  static const String Email_lbl_Txt = "Enter your email address and we\nwill send you a rest instruction.";
  static const String Email_reset_lbl_Txt = "We have sent a instructions email to Nawfazim@icloud.com.";
  static const String having_lbl_Txt = " Having problem?";
  static const String Email_error = "Provide Your Registered Email Id.";
  static const String reset_link = "Reset link";
  static const String reset_email_sent= "Reset email sent";
  static const String sent_again= "Send Again";

  /******************************** Sign In Screen ******************************/
  static const String SignIn_Welcome_TXT = "Welcome to Food Delivery";
  static const String SignIn_Enter_Email_phone_TXT = "Enter your phone number for sign in, Or\n";
  static const String SignIn_create_new_TXT = "Create new account.";

  /******************************** Phone Contact Screen ******************************/
  static const String Login_into_foodly = "Login To Foodly";
  static const String Verify_phone_number = "Verify Otp Number";
  static const String Enter_4_digit_Txt = "Enter the 4-Digit code";
  static const String Didnt_recieve_Txt = "Didn't receive code?";

  /******************************** Find Restaurnt Screen ******************************/
  static const String TXT_Find_Restaurants = "Find Restaurants";
  static const String TXT_Find_location = "Find location near you";
  static const String TXT_Please_enter_location = "Please enter your location or allow access to\nyour location to find restaurants near you.";
  static const String TXT_Please_enter_address = "Enter a new address";

  /******************************** Home Screen ******************************/

  static const String TXT_Delivery_Too = "Delivery To";
  static const String TXT_National_Favoriteso = "National Favorites";


  static const double TabButtonHeight = 80;
  static const double TabButtonTextSize = 20;

  static getTabBUTTONleftRightmargin() {
    return EdgeInsets.only(left: 100, right: 100);
  }

  static double regularTextSize = 16.0;
  static double regularTextFieldValueSize = 18.0;
  static double regularTextFieldValueSizeBig = 20.0;

  static Widget divider = Container(
    height: 2,
    color: AppColors.buttonHomePage,
  );

  static Widget dividerVertical = Container(
    height: double.infinity,
    width: 2,
    color: AppColors.buttonHomePage,
  );

  static backButtonStyle() {
    return TextStyle(color: Colors.white, fontSize: 17);
  }

  getTabSaveButton(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: AppConstant.getTabBUTTONleftRightmargin(),
      child: RaisedButton(
        color: AppColors.SaveButtoncolor,
        child: Text(
          AppConstant.SAVE_TXT,
          style: TextStyle(color: AppColors.SaveButtonTxtcolor, fontSize: 20),
        ),
        onPressed: () {},
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }

  getTitleBarTab(BuildContext context, String msgData,
      StatelessWidget navigationPage) {
    return Container(
        child: Stack(
          children: [
            Container(
              height: 40,
              width: 130,
              padding: EdgeInsets.only(left: 8),
              child: RaisedButton(
                color: AppColors.buttonHomePage,
                child: Text(
                  AppConstant.BACK_TXT,
                  style:backButtonStyle(),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => navigationPage));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
              ),
            ),
            Container(
              height: 40,
              child: Center(
                child: Text(
                  msgData,
                  style: TextStyle(
                      color: AppColors.buttonHomePage,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        )
    );
  }


}

//DateTime currentBackPressTime;


hideStatusBar() {
  SystemChrome.setEnabledSystemUIOverlays([]);
}

transparentStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.buttonHomePage,
  ));
}
showStatusBar() {
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
}


String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

/*Future<String> getCurrentLogggedUsername() async {
  var myproductlist =TBLlogin().getAllProducts();
  String Username="";
  myproductlist.then((value) {
    log("length " + value.length.toString());
    for (int x = 0; x < value.length; x++) {
      print(value[x].fname + " " + value[x].employee_id);
      Username=value[x].username;
    }
  });
  return Username;
}*/



getErrorAlertDialogBox(BuildContext context, String msgData) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.zero,
            title: Text("Alert",
                style:
                TextStyle(color: AppColors.SaveButtoncolor, fontSize: 20),
                textAlign: TextAlign.center),
            content: Container(
              // height: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(msgData,
                      style: TextStyle(
                          color: AppColors.SaveButtoncolor, fontSize: 16),
                      textAlign: TextAlign.center),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    color: AppColors.buttonHomePage,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('OK',
                      style: TextStyle(
                          color: AppColors.SaveButtoncolor, fontSize: 16),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ));
    },
  );
}

getSuccessAlertBox(BuildContext context, String msgData,
    StatelessWidget navigationPage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.zero,
            title: Text("Success",
                style:
                TextStyle(color: AppColors.SaveButtoncolor, fontSize: 20),
                textAlign: TextAlign.center),
            content: Container(
              //  height: 60,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(msgData,
                      style: TextStyle(
                          color: AppColors.SaveButtoncolor, fontSize: 20),
                      textAlign: TextAlign.center),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    color: AppColors.buttonHomePage,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 1,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => navigationPage));
                  },
                  child: Text('OK',
                      style: TextStyle(
                          color: AppColors.SaveButtoncolor, fontSize: 16),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ));
    },
  );
}