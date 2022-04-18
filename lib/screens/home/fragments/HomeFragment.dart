import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/singlerestaurant/SingleRestaurantScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Models/HomeScreenModels/HomeModelResponse.dart';
import '../../../Models/HomeScreenModels/HomeSliderModel.dart';
import '../../../Models/HomeScreenModels/RestuarntlistModel.dart';
import '../../../utils/Appconfig.dart';
import '../../../utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isLoading = false;
  bool is_show_list = false;
  bool is_loader = true;
  bool isNatioanl_label_txt = false;
  final toastmsg = ToastMsg();

  List<RestaurantsModel> listImages = [];

  List<HomeSliderModel> listSliderImages = [];

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

  late List data;
  late ScaffoldMessengerState scaffoldMessenger;
  String location = '', Address = '', city = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);

    GetPermissrion();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    location = '${place.subLocality}';
    city = '${place.locality}';
    //  print(Address);
    // print(location);
  }

  GetPermissrion() async {
    Position position = await _getGeoLocationPosition();
    // location = 'Lat: ${position.latitude} , Long: ${position.longitude}';

    GetAddressFromLatLong(position);
    setState(() {
      Constant.latitude = '${position.latitude}';
      Constant.longitude = '${position.longitude}';
      print("latitude: " + Constant.latitude);
      print("longitude: " + Constant.longitude);
      Constant.isInternetAvailable().then((IsConnected) async {
        if (IsConnected) {
          //onLoaderShow();

          get_home_page_data( Constant.latitude,Constant.longitude);
        } else {
          toastmsg.showToast(Appconfig.network_error, context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Visibility(
                    visible: is_loader,
                    child: Shimmer.fromColors(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 50, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 48.0,
                                    height: 48.0,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 185.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150.0,
                                      height: 48.0,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 48.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, right: 5, top: 10),
                                      child: Container(
                                        height: 220,
                                        color: AppColors.gray_350,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        direction: ShimmerDirection.ltr,
                        baseColor: AppColors.gray_200,
                        highlightColor: AppColors.gray_350),
                  ),
                  Visibility(
                    visible: is_show_list,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 50, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/pin_image.png",
                                height: 30,
                                width: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location,
                                      style: TextStyle(
                                        color: AppColors.font_red,
                                        fontSize: 14,
                                        fontFamily: 'Poppins Regular',
                                      ),
                                    ),
                                    Text(
                                      Address,
                                      style: TextStyle(
                                        color: AppColors.light_color,
                                        fontSize: 12,
                                        fontFamily: 'Poppins Regular',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 180.0,
                                        aspectRatio: 16 / 9,
                                        viewportFraction: 0.8,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: true,
                                        // pageSnapping: true,
                                        autoPlayInterval: Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            Duration(milliseconds: 1500),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        //onPageChanged: callbackFunction,
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        }),
                                    items: listSliderImages.map((i) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: Image.network(
                                                            i.image_url,
                                                            fit: BoxFit.cover,
                                                            width: 1000))),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
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
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
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
                          Visibility(
                            visible: isNatioanl_label_txt,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15.0, top: 20.0, right: 0.0),
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
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SingleRestaurantScreen()),
                                    );
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(top: 10, right: 20),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: listImages.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                            5.0,
                                          ),
                                          child: InkWell(
                                            child: Stack(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: 185,
                                                        height: 350,
                                                        child: Image.network(
                                                          listImages[index]
                                                              .image_url,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      /* child: Container(

                                                          decoration:  BoxDecoration(
                                                            image:  DecorationImage(
                                                                image:  NetworkImage(listImages[index].image_url,),

                                                                fit: BoxFit.cover,),
                                                          ),
                                                        ),*/
                                                    ),
                                                  ],
                                                ),
                                                Opacity(
                                                  opacity: 0.25,
                                                  child: Container(
                                                    color: AppColors.black,
                                                  ),
                                                  // child: MyGradientWidget(),
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10,
                                                            bottom: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
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
                                                                      left: 10.0),
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
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
                                                                          left:
                                                                              15.0),
                                                                  child: Text(
                                                                    listImages[
                                                                            index]
                                                                        .delivery_type,
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .White,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontFamily:
                                                                          'Poppins Regular',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                                                  listImages[
                                                                          index]
                                                                      .given_stars,
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: (){
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleRestaurantScreen()),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        listImages[index].restaurant_name,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                      Text(
                                        listImages[index].restaurant_type,
                                        style: TextStyle(
                                          color: AppColors.font_light_gray,
                                          fontSize: 14.0,
                                          fontFamily: 'Poppins Medium',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Future get_home_page_data() async {
    await http
        .get(
      Uri.parse(Appconfig.get_home_page_data),
    )
        .then((it) {
      if (it.statusCode == 200) {
        //  onLoaderDismiss();
        var response = HomeModelResponse.fromjson(json.decode(it.body));
        print(response);

        if (response.success == "true") {
          // onLoaderDismiss();
          if (isNatioanl_label_txt == false) {
            isNatioanl_label_txt = true;
          }
          if (is_loader == true) {
            is_loader=false;
            is_show_list=true;
            setState(() {
              is_loader;
               is_show_list;
            });
          }

          print(response.msg);

          listImages = response.data.list_restaurants;
          listSliderImages = response.data.list_slider_images;
        } else {
          isNatioanl_label_txt = true;
          // is_show_list=false;
          // onLoaderDismiss();
        }
      } else {
        isNatioanl_label_txt = true;
        // is_show_list=false;
        // onLoaderDismiss();
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
  */

  Future get_home_page_data(String latitude,String longitude) async {
    Map _params = {
      'radius': '10',
      'latitude': '$latitude',
      'longitude': '$longitude'
    };
    print(_params);
    await http
        .post(
      Uri.parse(Appconfig.get_home_page_data),
      body: _params,
    )
        .then((it) {
      if (it.statusCode == 200) {
        var response = HomeModelResponse.fromjson(json.decode(it.body));
        print(response);
        onLoaderDismiss();
        if (response.success == "true") {
          if (isNatioanl_label_txt == false) {
            isNatioanl_label_txt = true;
          }
          if (is_loader == true) {
            is_loader = false;
            is_show_list = true;
            setState(() {
              is_loader;
              is_show_list;
            });
          }

          print(response.msg);

          listImages = response.data.list_restaurants;
          listSliderImages = response.data.list_slider_images;
        } else {
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
    });
  }
}
