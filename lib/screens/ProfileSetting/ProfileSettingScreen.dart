
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/AppConstant.dart';
import '../../utils/ToastMsg.dart';


class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  bool isLoading = false;
  late ScaffoldMessengerState scaffoldMessenger;
  late SharedPreferences prefs;
  TextEditingController _controller_fullName = new TextEditingController();
  TextEditingController _controller_Email = new TextEditingController();
  TextEditingController _controller_Phone= new TextEditingController();
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
          'Profile Settings',
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
                                      'Full Name',
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
                                    controller: _controller_fullName,
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
                                      'Email Address',
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
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                      controller: _controller_Email,
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
                                      'Phone Number',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'DMSans Medium',
                                      ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  cursorColor: AppColors.black,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  controller: _controller_Phone,
                                  maxLength: 13,
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
                          "Change Profile".toUpperCase(),
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
    if (_controller_fullName.text.isEmpty) {
      toastmsg.showToast(AppConstant.Username_error, context);
      return false;
    } else if (_controller_Email.text.isEmpty) {
      toastmsg.showToast(AppConstant.email_error, context);
      return false;
    }else if (!_controller_Email.text.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      toastmsg.showToast(AppConstant.email_valid_error, context);
      return false;
    }else if (_controller_Phone.text.isEmpty) {
      toastmsg.showToast(AppConstant.PhoneNumber_error, context);
      return false;
    } else if (_controller_Phone.text.length < 10) {
      toastmsg.showToast(AppConstant.PhoneNumber_length_error, context);
      return false;
    }  else {
      return true;
    }
  }
}
