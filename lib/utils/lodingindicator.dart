import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery/utils/AppColors.dart';



class LoadingIndicator {
  static Widget isLoding() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.black26,
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              /*decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: new LinearGradient(
                    colors: [
                      AppColors.loderbackground,
                      AppColors.loderbackground,
                    ],
                  )),*/
              child: SpinKitCircle(
                color:AppColors.PageContainerGreycolor,
                size: 50.0,
                //controller: AnimationController(vsync:context,duration: const Duration(milliseconds: 1200)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}