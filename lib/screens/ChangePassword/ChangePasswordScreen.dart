
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/AppConstant.dart';
import '../../utils/ToastMsg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isLoading = false;
  bool _isObscure_CurPass = true;
  bool _isObscure_NewPass = true;
  bool _isObscure_ConfirmPass = true;
  late ScaffoldMessengerState scaffoldMessenger;
  late SharedPreferences prefs;
  TextEditingController _Cur_PasseordEdit = new TextEditingController();
  TextEditingController _New_PasseordEdit = new TextEditingController();
  TextEditingController _Confirm_PasseordEdit = new TextEditingController();
  final toastmsg = ToastMsg();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = new  ScaffoldMessengerState();
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Change Password',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16.0,
            fontFamily: 'Poppins SemiBold',
          ),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
            Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ListView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    children: [
                      Column(
                        children: [

                          Container(
                            padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 0.0,bottom: 15 , right: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Current Password',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'DMSans Medium',
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextFormField(
                                    cursorColor: AppColors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    obscureText: _isObscure_CurPass,
                                    controller: _Cur_PasseordEdit,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins Regular',
                                    ),

                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        color: Colors.red[500],
                                        fontSize: 14.0,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                              _isObscure_CurPass
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.font_light_gray),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure_CurPass = !_isObscure_CurPass;
                                            });
                                          }),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 0.0,bottom: 15 , right: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'New Password',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'DMSans Medium',
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextFormField(
                                    cursorColor: AppColors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    obscureText: _isObscure_NewPass,
                                    controller: _New_PasseordEdit,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins Regular',
                                    ),

                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        color: Colors.red[500],
                                        fontSize: 14.0,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                              _isObscure_NewPass
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.font_light_gray),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure_NewPass = !_isObscure_NewPass;
                                            });
                                          }),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 0.0,bottom: 15 , right: 0.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Confirm Password',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'DMSans Medium',
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextFormField(
                                    cursorColor: AppColors.black,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    obscureText: _isObscure_ConfirmPass,
                                    controller: _Confirm_PasseordEdit,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins Regular',
                                    ),

                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        color: Colors.red[500],
                                        fontSize: 14.0,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                              _isObscure_ConfirmPass
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: AppColors.font_light_gray),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure_ConfirmPass = !_isObscure_ConfirmPass;
                                            });
                                          }),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.box_border, width: 1.0),
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),

                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                ),
                Flexible(
                  child:Padding(
                    padding:EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
                    child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isValid()) {

                          }
                        },
                        child: Text(
                          "Change Password".toUpperCase(),
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
                  ) ,
                ),



              ],
            ),
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
    if (_Cur_PasseordEdit.text.isEmpty) {
      toastmsg.showToast(AppConstant.UserPasswordCureent_error, context);
      return false;
    } else if (_New_PasseordEdit.text.isEmpty) {
      toastmsg.showToast(AppConstant.UserPasswordNew_error, context);
      return false;
    } else if (_Confirm_PasseordEdit.text.isEmpty) {
      toastmsg.showToast(AppConstant.UserPasswordConfrim_error, context);
      return false;
    }else {
      return true;
    }
  }
}
