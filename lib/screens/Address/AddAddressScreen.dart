
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/Address/AddresslistScreen.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppConstant.dart';
import '../../utils/Appconfig.dart';
import '../../utils/ToastMsg.dart';
import '../../utils/constant.dart';
import '../../utils/lodingindicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../home/HomeScreen.dart';

class AddAddressScreen extends StatefulWidget {


  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final toastmsg = ToastMsg();
  bool isLoading = false;
  late SharedPreferences prefs;
  late ScaffoldMessengerState scaffoldMessenger;
  late int user_id,address_id;
  String  str_user_id="",str_address_id="";


  TextEditingController Address_1_edt_controller = new TextEditingController();
  TextEditingController Address_2_edt_controller = new TextEditingController();
  TextEditingController Landmark_edt_controller = new TextEditingController();
  TextEditingController MobileNumber_edt_controller = new TextEditingController();
  TextEditingController City_edt_controller = new TextEditingController();
  TextEditingController ZipCode_edt_controller = new TextEditingController();
  TextEditingController State_edt_controller = new TextEditingController();
  TextEditingController Country_edt_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*GestureDetector(
              child: Image.asset(
                'assets/back_arrow_dark.png',width: 8,height: 14,
                fit: BoxFit.cover,

              ),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddresslistScreen()),);
              },
            ),*/
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddresslistScreen()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),

            Text(
              AppConstant.Add_Address_txt,
              style: TextStyle(
                color: AppColors.font_red,
                fontSize: 21.0,
                fontFamily: 'Poppins SemiBold',
              ),
            ),
            Text(
              '',
              style: TextStyle(
                color: AppColors.font_red,
                fontSize: 21.0,
                fontFamily: 'Poppins Regular',
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.PageBackgroundcolor,

      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: Address_1_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Address 1",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: Address_2_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Address 2",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: Landmark_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Landmark",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    controller: MobileNumber_edt_controller,
                    maxLength: 13,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: City_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "City",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: ZipCode_edt_controller,
                    //maxLength: 8,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Zip Code",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: State_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "State",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  color: AppColors.input_color,
                  padding:
                  EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  child: TextFormField(
                    cursorColor: AppColors.font_light_gray,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: Country_edt_controller,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                    decoration: InputDecoration(
                      labelText: "Country",
                      labelStyle:
                      TextStyle(color: AppColors.font_light_gray),
                      // hintText: AppConstant.Email_TXT,

                      //  hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(
                        color: Colors.red[500],
                        fontSize: 15.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.box_border, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),

                      /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                    ),
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0,bottom: 30),
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isValid()) {
                          Constant.isInternetAvailable()
                              .then((IsConnected) async {
                            if (IsConnected) {
                              onLoaderShow();
                              if(Constant.check_flow=="1"){
                                Update_Address(
                                  Address_1_edt_controller.text.trim(),
                                  Address_2_edt_controller.text.trim(),
                                  Landmark_edt_controller.text.trim(),
                                  MobileNumber_edt_controller.text.trim(),
                                  City_edt_controller.text.trim(),
                                  ZipCode_edt_controller.text.trim(),
                                  State_edt_controller.text.trim(),
                                  Country_edt_controller.text.trim(),
                                );
                              }else{
                                Add_Address(
                                  Address_1_edt_controller.text.trim(),
                                  Address_2_edt_controller.text.trim(),
                                  Landmark_edt_controller.text.trim(),
                                  MobileNumber_edt_controller.text.trim(),
                                  City_edt_controller.text.trim(),
                                  ZipCode_edt_controller.text.trim(),
                                  State_edt_controller.text.trim(),
                                  Country_edt_controller.text.trim(),
                                );
                              }

                              FocusScope.of(context).unfocus();
                            } else {
                              toastmsg.showToast(
                                  Appconfig.network_error, context);
                            }
                          });
                        }
                      },
                      child: Text(
                       AppConstant.Add_Address_txt,
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
                Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                ),
              ],

            ),
            Visibility(visible: isLoading, child: LoadingIndicator.isLoding()),
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
  Future<SharedPreferences> islogedin() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogedin().then((it) {
      setState(() {
        user_id = it.getInt(Appconfig.userid)!;
        address_id= Constant.id;
        str_user_id = "$user_id";
        str_address_id ="$address_id";
        print( str_user_id);
        print( str_address_id);
      });
    });
    ChnageText();

  }

  bool isValid() {
    if (Address_1_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Address_1_error, context);
      return false;
    } else  if (Address_2_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Address_2_error, context);
      return false;
    }else  if (Landmark_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Landmark_error, context);
      return false;
    }else  if (MobileNumber_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Mobile_error, context);
      return false;
    } else  if (MobileNumber_edt_controller.text.length<10) {
      toastmsg.showToast(AppConstant.PhoneNumber_length_error, context);
      return false;
    } else  if (City_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_City_error, context);
      return false;
    } else  if (ZipCode_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Zipcode_error, context);
      return false;
    }  else  if (State_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_State_error, context);
      return false;
    } else  if (Country_edt_controller.text.isEmpty) {
      toastmsg.showToast(AppConstant.Add_Country_error, context);
      return false;
    }  else {
      return true;
    }
  }

  ChnageText(){
    setState(() {
      if(Constant.check_flow=="1"){
        AppConstant.Add_Address_txt="Update Address";
        Address_1_edt_controller.text=Constant.address_1;
        Address_2_edt_controller.text=Constant.address_2;
        Landmark_edt_controller.text=Constant.landmark;
        MobileNumber_edt_controller.text=Constant.Mobile_number;
        City_edt_controller.text=Constant.City;
        ZipCode_edt_controller.text=Constant.zipcode;
        State_edt_controller.text=Constant.state;
        Country_edt_controller.text=Constant.country;
      }else{
        AppConstant.Add_Address_txt="Add Address";
        Address_1_edt_controller.text="";
        Address_2_edt_controller.text="";
        Landmark_edt_controller.text="";
        MobileNumber_edt_controller.text="";
        City_edt_controller.text="";
        ZipCode_edt_controller.text="";
        State_edt_controller.text="";
        Country_edt_controller.text="";
      }
    });
  }

  Add_Address(address1, address2,landmark,mobile,city,zipcode,state,country) async {
    Map data = {'user_id':str_user_id,'address1': address1, 'address2': address2,'landmark':landmark,'mobile_no':mobile,'city':city,'zip_code':zipcode,'state':state,'country':country};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.add_address),
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  AddresslistScreen() ));
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.font_green));
      } else {

        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.red));
      }
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Please try again!"), backgroundColor: AppColors.red));
    }
  }

  Update_Address(address1, address2,landmark,mobile,city,zipcode,state,country) async {
    Map data = {'user_id':str_user_id,'address_id':str_address_id,'address1': address1, 'address2': address2,'landmark':landmark,'mobile_no':mobile,'city':city,'zip_code':zipcode,'state':state,'country':country};
    print(data.toString());
    final response = await http.post(Uri.parse(Appconfig.address_update),
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  AddresslistScreen() ));
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.font_green));
      } else {

        scaffoldMessenger.showSnackBar(SnackBar(content: Text("${resposne['message']}"), backgroundColor: AppColors.red));
      }
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text("Please try again!"), backgroundColor: AppColors.red));
    }
  }
}
