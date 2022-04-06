import 'package:connectivity/connectivity.dart';

class Constant {
  static String tab="";
  static String friendid="";
  static String firebasepassword="12345678";


  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await new Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
  static int id=0;
  static String address_1="";
  static String address_2="";
  static String landmark="";
  static String  Mobile_number="";
  static String City="";
  static String zipcode="";
  static String state="";
  static String country="";
  static String check_flow="";
}