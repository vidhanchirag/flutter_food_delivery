import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastMsg{
  showToast(String str,BuildContext context){
    Toast.show(str, context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
  }
}