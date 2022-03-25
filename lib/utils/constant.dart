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

  
}