import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/phonenumber/PhoneVerify.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';

class FindRestaurantsScreen extends StatefulWidget {
  const FindRestaurantsScreen({Key? key}) : super(key: key);

  @override
  _FindRestaurantsScreenState createState() => _FindRestaurantsScreenState();
}

class _FindRestaurantsScreenState extends State<FindRestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstant.TXT_Find_Restaurants,
          style: TextStyle(
              color: AppColors.font_red,
              fontSize: 21.0,
              fontFamily: 'Poppins SemiBold'),
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
        leading: InkWell(
          onTap: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PhoneVerify()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 40.0, right: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppConstant.TXT_Find_location,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 24.0,
                    fontFamily: 'Poppins Medium'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppConstant.TXT_Please_enter_location,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 20, 30),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.red,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Center(
                            child: Image.asset(
                          'assets/red arrow.png',
                          height: 17,
                          width: 17,
                        )),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Use current location',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Center(
                          child: Image.asset(
                        'assets/marker.png',
                        height: 23,
                        width: 20,
                      )),
                    ),
                    Flexible(
                      child: Container(
                        color: AppColors.input_color,
                        child: TextFormField(
                          cursorColor: AppColors.font_light_gray,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(
                            color: AppColors.font_light_gray,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Regular',
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: AppColors.font_light_gray),
                            hintText: AppConstant.TXT_Please_enter_address,

                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),

                            //  hintStyle: TextStyle(color: Colors.white),
                            errorStyle: TextStyle(
                              color: Colors.red[500],
                              fontSize: 15.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border,width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.box_border, width: 1.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            /* border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0)),*/
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ListTile(
                          selected: true,
                          leading: CircleAvatar(
                            backgroundColor: AppColors.White,
                            child: Image.asset(
                              'assets/red arrow.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          title: Text(
                            "New York",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                          subtitle: Text("United States of America",
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 13.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),

                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0,right: 60),
                        child: Divider(
                          color: AppColors.divider_color,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
