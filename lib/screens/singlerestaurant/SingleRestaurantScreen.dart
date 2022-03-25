import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:food_delivery/screens/addtocart/AddToCart.dart';
import 'package:food_delivery/screens/home/HomeScreen.dart';
import 'package:food_delivery/screens/home/fragments/HomeFragment.dart';
import 'package:food_delivery/utils/AppColors.dart';

class SingleRestaurantScreen extends StatefulWidget {
  const SingleRestaurantScreen({Key? key}) : super(key: key);

  @override
  _SingleRestaurantScreenState createState() => _SingleRestaurantScreenState();
}

class _SingleRestaurantScreenState extends State<SingleRestaurantScreen> {
  String tempData = '\$\$ - Chinese - American - Deshi Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Card(
                          color: AppColors.White,
                          elevation: 8.0,
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            child: ImageSlideshow(
                              width: double.infinity,
                              height: 290,
                              initialPage: 0,
                              indicatorColor: Colors.white,
                              indicatorBackgroundColor: Colors.grey,
                              onPageChanged: (value) {
                                debugPrint('Page changed: $value');
                              },
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children: [
                                Image.asset(
                                  'assets/header_image.png',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'assets/header_image.png',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'assets/header_image.png',
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()),
                                  );
                                },
                                child: Image.asset(
                                  "assets/back.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Image.asset(
                                        "assets/combine_back.png",
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                        "assets/search_white.png",
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        "Mayfield Bakery & Cafe",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24.0,
                          fontFamily: 'Poppins SemiBold',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            tempData,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.font_light_gray,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            "4.3",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.0,
                              fontFamily: 'Poppins Medium',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Image.asset("assets/star.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "200 + Ratings",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.0,
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/doller_bg_red.png",
                          height: 21,
                          width: 21,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Free",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins Medium',
                                ),
                              ),
                              Text(
                                "Delivery",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.font_light_gray,
                                  fontSize: 12.0,
                                  fontFamily: 'Poppins Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            width: 25,
                          ),
                        ),
                        Image.asset(
                          "assets/clock.png",
                          height: 25,
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "25",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins Medium',
                                ),
                              ),
                              Text(
                                "Minutes",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.font_light_gray,
                                  fontSize: 12.0,
                                  fontFamily: 'Poppins Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              color: Colors.transparent,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 50, right: 20),
                              height: 38,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddToCart()),
                                  );
                                },
                                child: Text(
                                  "Add".toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 12.0,
                                    fontFamily: 'Poppins SemiBold',
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(5.0)),
                                    side: BorderSide(
                                      width: 0.8,
                                      color: Colors.red,
                                    ),
                                    primary: AppColors.White),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Featured Items',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20.0,
                          fontFamily: 'Poppins Medium',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 205,
                        width: MediaQuery.of(context).size.width,

                        // <-- you should put some value here
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/item_bg.png"),
                                  Text(
                                    'Cookie Sandwich',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins Medium',
                                    ),
                                  ),
                                  Text(
                                    '\$ 10 - Chinese',
                                    style: TextStyle(
                                      color: AppColors.font_light_gray,
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins Regular',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(

                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        // <-- you should put some value here
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Sea Food',
                                            style: TextStyle(
                                              color: AppColors.red,
                                              fontSize: 24.0,
                                              fontFamily: 'Poppins SemiBold',
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 3.0),
                                            child: Container(
                                              height:1.0,
                                              width:90.0,
                                                color:AppColors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,left: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Appetizser',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 24.0,
                                                fontFamily: 'Poppins SemiBold',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3.0),
                                              child: Container(
                                                height:1.0,
                                                width:90.0,
                                                color:AppColors.font_green,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10,left: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Junk Food',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 24.0,
                                                fontFamily: 'Poppins SemiBold',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3.0),
                                              child: Container(
                                                height:1.0,
                                                width:90.0,
                                                color:AppColors.font_green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Most Populars',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20.0,
                          fontFamily: 'Poppins Medium',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(

                    children: [
                      SizedBox(
                        height: 205,
                        width: MediaQuery.of(context).size.width,
                        // <-- you should put some value here
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,top: 10),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/food.png"),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cookie Sandwich',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 18.0,
                                                fontFamily: 'Poppins Medium',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: SizedBox(
                                                child: Text(
                                                  'Shortbread, chocolate turtle cookies,\nand red velvet.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    color: AppColors.font_light_gray,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Poppins Regular',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    '\$ 10 - Chinese',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: AppColors.font_light_gray,
                                                      fontSize: 14.0,
                                                      fontFamily: 'Poppins Regular',
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text(
                                                      'USD7.4',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: AppColors.font_green,
                                                        fontSize: 14.0,
                                                        fontFamily: 'Poppins SemiBold',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Divider(
                                    color: AppColors.divider_color,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Sea Food',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20.0,
                          fontFamily: 'Poppins Medium',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Column(

                    children: [
                      SizedBox(
                        height: 205,
                        width: MediaQuery.of(context).size.width,
                        // <-- you should put some value here
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,top: 10),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/item_bg.png"),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Cookie Sandwich',
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 18.0,
                                                fontFamily: 'Poppins Medium',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: SizedBox(
                                                child: Text(
                                                  'Shortbread, chocolate turtle cookies,\nand red velvet.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    color: AppColors.font_light_gray,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Poppins Regular',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    '\$ 10 - Chinese',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: AppColors.font_light_gray,
                                                      fontSize: 14.0,
                                                      fontFamily: 'Poppins Regular',
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 20),
                                                    child: Text(
                                                      'USD7.4',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: AppColors.font_green,
                                                        fontSize: 14.0,
                                                        fontFamily: 'Poppins SemiBold',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Divider(
                                    color: AppColors.divider_color,
                                  ),
                                ),
                              ],
                            );
                          },
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
    );
  }
}
