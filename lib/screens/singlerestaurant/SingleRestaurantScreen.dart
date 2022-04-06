import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../utils/ToastMsg.dart';
import '../../utils/lodingindicator.dart';
import '../addtocart/AddToCart.dart';
import '../home/HomeScreen.dart';

class SingleRestaurantScreen extends StatefulWidget {
  const SingleRestaurantScreen({Key? key}) : super(key: key);

  @override
  _SingleRestaurantScreenState createState() => _SingleRestaurantScreenState();
}

class _SingleRestaurantScreenState extends State<SingleRestaurantScreen> {
  final toastmsg = ToastMsg();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Card(
                                color: AppColors.White,
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ImageSlideshow(
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
                            SizedBox(
                              height: 150,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
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
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: Image.asset(
                                              "assets/combine_back.png",
                                              height: 25,
                                              width: 25,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
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
                          padding: const EdgeInsets.only(left: 15.0, top: 10.0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: _tabSection(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Visibility(visible: isLoading, child: LoadingIndicator.isLoding()),
          ],
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
              indicatorColor: AppColors.red,
              unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'DMSans Bold',
                  color: AppColors.black),
              labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'DMSans Bold',
                  color: AppColors.black),
              labelColor: AppColors.red,
              unselectedLabelColor: AppColors.black,
              isScrollable: true,
              tabs: [
                Tab(text: "Sea Food"),
                Tab(text: "Appetizers"),
                Tab(text: "Dim Sum"),
                Tab(text: "Fast Food"),
              ]),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,

            child: TabBarView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                    child: Text(
                      "Most Populars",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Row(

                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.loose,
                              child: Image.asset("assets/food.png"),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cookie Sandwich',
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 22.0,
                                            fontFamily: 'Poppins Medium',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Shortbread, chocolate turtle cookies, and red velvet.',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.font_light_gray,
                                              fontSize: 16.0,
                                              fontFamily: 'Poppins Regular',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'USD7.4',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.font_green,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Poppins SemiBold',
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                height: 25,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                    child: Text(
                      "Most Populars",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Row(

                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.loose,
                              child: Image.asset("assets/food.png"),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cookie Sandwich',
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 22.0,
                                            fontFamily: 'Poppins Medium',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Shortbread, chocolate turtle cookies, and red velvet.',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.font_light_gray,
                                              fontSize: 16.0,
                                              fontFamily: 'Poppins Regular',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'USD7.4',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.font_green,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Poppins SemiBold',
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                height: 25,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                    child: Text(
                      "Most Populars",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Row(

                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.loose,
                              child: Image.asset("assets/food.png"),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cookie Sandwich',
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 22.0,
                                            fontFamily: 'Poppins Medium',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Shortbread, chocolate turtle cookies, and red velvet.',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.font_light_gray,
                                              fontSize: 16.0,
                                              fontFamily: 'Poppins Regular',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'USD7.4',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.font_green,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Poppins SemiBold',
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                height: 25,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                    child: Text(
                      "Most Populars",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                        child: Row(

                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.loose,
                              child: Image.asset("assets/food.png"),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cookie Sandwich',
                                          style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 22.0,
                                            fontFamily: 'Poppins Medium',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Shortbread, chocolate turtle cookies, and red velvet.',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.font_light_gray,
                                              fontSize: 16.0,
                                              fontFamily: 'Poppins Regular',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'USD7.4',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppColors.font_green,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Poppins SemiBold',
                                                ),
                                              ),
                                              Container(
                                                color: Colors.transparent,
                                                height: 25,
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
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
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
}
