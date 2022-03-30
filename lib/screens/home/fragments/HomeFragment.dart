import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_delivery/screens/home/FliterScreen.dart';
import 'package:food_delivery/screens/introscreen/SliderModel.dart';
import 'package:food_delivery/screens/singlerestaurant/SingleRestaurantScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'package:food_delivery/utils/ToastMsg.dart';
import 'package:food_delivery/utils/lodingindicator.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isLoading = false;
  final toastmsg = ToastMsg();

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
    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1681&q=80",
    "https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80",
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

  String location = '';
  String Address = '';

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
    print(Address);
    print(location);
    setState(() {});
  }

  GetPermissrion() async {
    Position position = await _getGeoLocationPosition();
    // location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    // print(location);
    GetAddressFromLatLong(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
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
                                        pageSnapping: true,
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
                                                        child: Image.network(i,
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
                          Row(
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
                            color: AppColors.White,
                            child: GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,

                              //physics: ScrollPhysics(),
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: List.generate(10, (index) {return Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)), color: Colors.transparent,),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Stack(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        child: FadeInImage
                                                            .memoryNetwork(
                                                                // placeholder: kTransparentImage,
                                                                placeholder: kTransparentImage,
                                                                image: listImages[index],
                                                                fit: BoxFit.fill),
                                                      ),
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
                                                    padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                                                    child: Column(
                                                     mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image.asset('assets/fast_delivery.png', height: 25, width: 25,),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10.0),
                                                              child: Text(
                                                                '25min',
                                                                style: TextStyle(
                                                                  color: AppColors.White,
                                                                  fontSize: 12.0,
                                                                  fontFamily: 'Poppins Regular',
                                                                ),
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset('assets/doller.png', height: 20, width: 20,),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 15.0),
                                                                  child: Text(
                                                                    'Free',
                                                                    style: TextStyle(
                                                                      color: AppColors.White,
                                                                      fontSize: 12.0,
                                                                      fontFamily: 'Poppins Regular',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Card(
                                                              color: AppColors.font_green,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                              child: Padding(
                                                                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                                                                child: Text('4.5',
                                                                  style: TextStyle(
                                                                    letterSpacing: 1.0,
                                                                    color: AppColors.White,
                                                                    fontSize: 12.0,
                                                                    fontFamily: 'Poppins Regular',
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
