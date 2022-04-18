import 'package:flutter/material.dart';
import 'package:food_delivery/screens/ChangePassword/ChangePasswordScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ProfileSetting/ProfileSettingScreen.dart';
import '../../signin/SignIn_Screen.dart';


class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  bool isToggled_Push_Notification = true;
  bool isToggled_SMS_Notification = false;
  bool isToggled_Promotional_Notification = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Settings',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 28.0,
                    fontFamily: 'Poppins SemiBold',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Update your settings like notifications, payments, profile edit etc.',
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                  ),
                ),

                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/account_profile.png",height: 24,width: 24,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0,right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Profile Information',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                      Text(
                                        'Change your account information',
                                        style: TextStyle(
                                          color: AppColors.font_light_gray,
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileSettingScreen()),
                    );
                  },
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0,right: 5),
                                child: Image.asset("assets/lock.png",height: 16,width: 14,),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                      Text(
                                        'Change your password',
                                        style: TextStyle(
                                          color: AppColors.font_light_gray,
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/card.png",height: 24,width: 24,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Payment Methods',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'Add your credit & debit cards',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Image.asset("assets/location.png",height: 18,width: 16,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Locations',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'Add or remove your delivery locations',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Notifications'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins SemiBold ',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Image.asset("assets/notification_img.png",height: 15.67,width: 16.7,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Push Notifications',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'For daily update you will get it',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FlutterSwitch(
                          height: 24.0,
                          width: 49.0,
                          padding: 4.0,
                          toggleSize: 20.0,
                          borderRadius: 16.0,
                          activeColor: AppColors.red,
                          value: isToggled_Push_Notification,
                          onToggle: (value) {
                            setState(() {
                              isToggled_Push_Notification = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Image.asset("assets/notification_img.png",height: 15.67,width: 16.7,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SMS Notifications',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'For daily update you will get it',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FlutterSwitch(
                          height: 24.0,
                          width: 49.0,
                          padding: 4.0,
                          toggleSize: 20.0,
                          borderRadius: 16.0,
                          activeColor: AppColors.red,
                          value: isToggled_SMS_Notification,
                          onToggle: (value) {
                            setState(() {
                              isToggled_SMS_Notification = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Image.asset("assets/notification_img.png",height: 15.67,width: 16.7,),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Promotional Notifications',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'For daily update you will get it',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FlutterSwitch(
                          height: 24.0,
                          width: 49.0,
                          padding: 4.0,
                          toggleSize: 20.0,
                          borderRadius: 16.0,
                          activeColor: AppColors.red,
                          value: isToggled_Promotional_Notification,
                          onToggle: (value) {
                            setState(() {
                              isToggled_Promotional_Notification = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'More'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins SemiBold ',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/star.png",height: 24,width: 24,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rate Us',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'Rate us playstore, appstor',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/faq_document.png",height: 24,width: 24,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FAQ',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                    Text(
                                      'Frequently asked questions',
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Medium',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                    ],
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset("assets/logout.png",height: 15,width: 16.39,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 5),
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins Medium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/forword_arrow_dark_blacl.png",height: 14,width: 8,),
                      ],
                    ),
                  ),
                  onTap: (){
                    showAlertDialog(context);
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  showAlertDialog(BuildContext contex) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();


      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn_Screen()),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Food Delivery"),
      content: Text("Are you sure want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
