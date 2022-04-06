import 'package:flutter/material.dart';
import 'package:food_delivery/screens/Address/AddAddressScreen.dart';
import 'package:food_delivery/screens/signup/SignUp.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/AddressListModel/AddressDataModel.dart';
import '../../Models/AddressListModel/AddressReponse.dart';
import '../../utils/Appconfig.dart';
import '../../utils/ToastMsg.dart';
import '../../utils/constant.dart';
import '../../utils/lodingindicator.dart';

class AddresslistScreen extends StatefulWidget {
  const AddresslistScreen({Key? key}) : super(key: key);

  @override
  State<AddresslistScreen> createState() => _AddresslistScreenState();
}

class _AddresslistScreenState extends State<AddresslistScreen> {
  final toastmsg = ToastMsg();
  bool isLoading = false;
  late SharedPreferences prefs;
  late int user_id;
  String str_user_id = "";
  bool _value = false;
  late ScaffoldMessengerState scaffoldMessenger;
  List<AddressDataModel> listAddressData = [];

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
            GestureDetector(
              child: Image.asset(
                'assets/back_arrow_dark.png',
                width: 8,
                height: 14,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Address',
                style: TextStyle(
                  color: AppColors.font_red,
                  fontSize: 21.0,
                  fontFamily: 'Poppins SemiBold',
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Constant.check_flow="0";
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddAddressScreen()),);
                },
                child: Text(
                  "+",
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 14.0,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    side: BorderSide(
                      width: 0.8,
                      color: Colors.red,
                    ),
                    primary: AppColors.White),
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
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: listAddressData.length,
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       /* Radio<bool>(
                          value: true,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          },
                          activeColor: AppColors.red,
                        ),*/
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0,left: 15),
                            child: Card(
                              color: AppColors.box_border,
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        listAddressData[index].address1 +
                                            ",\n" +
                                            listAddressData[index].address2 +
                                            ",\n" +
                                            listAddressData[index].landmark +
                                            ",\n" +
                                            listAddressData[index].city +
                                            ",\n" +
                                            listAddressData[index].zip_code +
                                            ",\n" +
                                            listAddressData[index].state +
                                            ", " +
                                            listAddressData[index].country +
                                            ".",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 14.0,
                                            fontFamily: 'Poppins Regular',
                                            letterSpacing: 1.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Column(
                                        children: [
                                          InkWell(
                                            child: Image.asset(
                                              "assets/edit.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            onTap: (){
                                              Constant.check_flow="1";
                                              Constant.id=listAddressData[index].id;
                                              Constant.address_1=listAddressData[index].address1 ;
                                              Constant.address_2=listAddressData[index].address2 ;
                                              Constant.landmark=listAddressData[index].landmark ;
                                              Constant.Mobile_number=listAddressData[index].mobile_no ;
                                              Constant.City=listAddressData[index].city ;
                                              Constant.zipcode=listAddressData[index].zip_code ;
                                              Constant.state=listAddressData[index].state ;
                                              Constant.country=listAddressData[index].country ;
                                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) =>  AddAddressScreen ()));
                                            },
                                          ),
                                          InkWell(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Image.asset(
                                                "assets/delete.png",
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                            onTap: () {
                                              Constant.isInternetAvailable().then((IsConnected) async {
                                                if (IsConnected) {
                                                  //  onLoaderShow();
                                                  showAlertDialog(context,listAddressData[index].id);

                                                } else {
                                                  toastmsg.showToast(Appconfig.network_error, context);
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
        str_user_id = "$user_id";
        print("user_id " + str_user_id);
      });
    });

    Constant.isInternetAvailable().then((IsConnected) async {
      if (IsConnected) {
        //  onLoaderShow();
        AddressList();
      } else {
        toastmsg.showToast(Appconfig.network_error, context);
      }
    });
  }

  showAlertDialog(BuildContext context,int id) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();


      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        DeleteAddress(id);
        Navigator.of(context, rootNavigator: true).pop();

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Food Delivery"),
      content: Text("Are you sure want to delete this address?"),
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

  AddressList() async {
    onLoaderShow();
    Map _params = {'user_id': '$str_user_id'};
    await http.post(Uri.parse(Appconfig.List_address), body: _params,).then((it) {
      if (it.statusCode == 200) {
        onLoaderDismiss();

        var response = AddressReponse.fromjson(json.decode(it.body));
        if (response.success) {
          setState(() {
            listAddressData = response.list_data;
          });
        } else {
          setState(() {
            listAddressData = response.list_data;
          });
          scaffoldMessenger.showSnackBar(SnackBar(
              content: Text("${response.msg}"),
              backgroundColor: AppColors.red));
        }
      } else {
        onLoaderDismiss();
      }
    }).catchError((e) {
      onLoaderDismiss();
      print(e.toString());
      //toastmsg.showToast(e.toString(), context);
    });
  }

  DeleteAddress(int address_id) async {
    onLoaderShow();
    Map _params = {'user_id': '$str_user_id','address_id': '$address_id'};
    await http
        .post(
      Uri.parse(Appconfig.address_delete),
      body: _params,
    )
        .then((it) {
      if (it.statusCode == 200) {
        onLoaderDismiss();

        var response = AddressReponse.fromjson(json.decode(it.body));
        if (response.success) {

          scaffoldMessenger.showSnackBar(SnackBar(content: Text("${response.msg}"), backgroundColor: AppColors.font_green));
          AddressList();

        } else {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text("${response.msg}"), backgroundColor: AppColors.red));
        }
      } else {
        onLoaderDismiss();
      }
    }).catchError((e) {
      onLoaderDismiss();
      print(e.toString());
      //toastmsg.showToast(e.toString(), context);
    });
  }



}
