import 'package:flutter/material.dart';
import 'package:food_delivery/screens/Address/AddresslistScreen.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/introscreen/OnBoardingScreen.dart';
import 'package:food_delivery/utils/Appconfig.dart';
import 'utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  bool isLogin = false,isLoggedIn=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isNotLoggedIn().then((it) {
      runForSec(it);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Center(
                  child: Image.asset('assets/splash_logo.png'),
                ),
              ),
              /*Padding(
                padding: EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                child: Center(
                  child: Image.asset('assets/splash_next.png'),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> isNotLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    isLogin = (prefs.getBool(Appconfig.is_login) ?? false);
    isLogin = isLogin ? true : false;
    print("chirag main"+prefs.getBool(Appconfig.is_login).toString());
    return isLogin && isLogin != null;
  }
  void runForSec(bool it) {
    Future.delayed(Duration(seconds: 2), () async {
      if(it==true){
        await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  HomeScreen() ));
      }else{
        await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  OnBoardingScreen() ));
      }

    });
  }
}

