import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/screens/home/FliterScreen.dart';
import 'package:food_delivery/screens/introscreen/SliderModel.dart';
import 'package:food_delivery/screens/singlerestaurant/SingleRestaurantScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<String> listImages = [

    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1681&q=80",
    "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80",
    "https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1681&q=80",
    "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80",
    "https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1681&q=80",
    "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80",
    "https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ];

  List<String> listSliderImages = [


    "https://images.unsplash.com/photo-1561758033-7e924f619b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1681&q=80",
    "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",


  ];

  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  late PageController _controller;

  String dropdownvalue = 'Ahmedabad';
  var items = [
    'Ahmedabad',
    'Mumbai',
    'Surat',
    'Delihi',
    'Vadodara',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 0.0, top: 50.0, right: 0.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  AppConstant.TXT_Delivery_Too.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 16.0,
                    fontFamily: 'Poppins Medium',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    color: Colors.transparent,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        // Initial Value

                        value: dropdownvalue,
                        // Down Arrow Icon

                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(color: AppColors.black),
                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 22.0,
                                fontFamily: 'Poppins Medium',
                              ),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    /* Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    );*/
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, right: 20),
                    child: Text(
                      'Filter',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16.0,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Material(
              /* elevation: 1.0,
              shadowColor: AppColors.shadow_color,*/
              child: Container(
                color: AppColors.White,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Divider(
                            color: AppColors.shadow_color,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                /* child: ImageSlideshow(
                  width: double.infinity,
                  height: 188,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      'assets/home_slider_image.png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/home_slider_image.png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/home_slider_image.png',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                */
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        pageSnapping: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,

                        //onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }
                      ),
                      items: listSliderImages.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Expanded(

                                child: ClipRRect( borderRadius: BorderRadius.circular(15),child: Image.network(i, fit: BoxFit.cover, width: 1000)),
                              ),

                            );
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: listSliderImages.map((url) {
                          int index = listSliderImages.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                color: currentIndex == index
                                  ? AppColors.font_green
                                  : AppColors.font_light_gray,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 15.0, top: 20.0, right: 0.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppConstant.TXT_National_Favoriteso,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24.0,
                        fontFamily: 'Poppins SemiBold',
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SingleRestaurantScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, right: 20),
                    child: Text(
                      'See all',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: 16.0,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin:
              EdgeInsets.only(left: 15, top: 0, right: 5, bottom: 10),
              child:  GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List.generate(
                  10,
                      (index) {
                   return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                    child: FadeInImage.memoryNetwork(
                                      // placeholder: kTransparentImage,
                                        placeholder: kTransparentImage,
                                        image: listImages[index],
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.25,

                                  //child: MyGradientWidget(),
                                ),
                                Container(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(
                                              7, 0, 15, 10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/fast_delivery.png',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Text(
                                                          '25min',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .White,
                                                            fontSize: 12.0,
                                                            fontFamily:
                                                            'Poppins Regular',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(
                                              10, 0, 15, 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/doller.png',
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        child: Text(
                                                          'Free',
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .White,
                                                            fontSize: 12.0,
                                                            fontFamily:
                                                            'Poppins Regular',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      right: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Card(
                                                        color: AppColors
                                                            .font_green,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5)),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .fromLTRB(
                                                              10,
                                                              1,
                                                              10,
                                                              1),
                                                          child: Text(
                                                            '4.5',
                                                            style:
                                                            TextStyle(
                                                              letterSpacing:
                                                              1.0,
                                                              color:
                                                              AppColors
                                                                  .White,
                                                              fontSize:
                                                              12.0,
                                                              fontFamily:
                                                              'Poppins Regular',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 12, top: 5),
                            child: Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "McDonald's",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins Medium',
                                    ),
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "   Chinese-American",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.font_light_gray,
                                fontSize: 16,
                                fontFamily: 'Poppins Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class MyGradientWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.center,
          colors: [Colors.black, Colors.black],
        ),
      ),
    );
  }
}
