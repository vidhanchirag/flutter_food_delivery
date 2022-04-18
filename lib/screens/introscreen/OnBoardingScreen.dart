import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/signin/SignIn_Screen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';
import 'SliderModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  bool end = false;
  final PageController _controller = PageController(initialPage: 0);
  bool _isVisible  = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                      print(currentIndex);
                      if(currentIndex==2){
                        _isVisible=true;
                      }else{
                        _isVisible=false;
                      }
                    });
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    // contents of slider
                    return Slider(
                      image: slides[index].getImage(),
                      title: slides[index].getTitle(),
                      description: slides[index].getDescription(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Container(
                padding: EdgeInsets.only(left: 30.0,top: 40.0,right: 30.0,bottom: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn_Screen()),
                        );
                      },
                      child: Text(
                        AppConstant.Get_Started_TXT.toUpperCase(),
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
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }




  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 8),

      /* decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.red,


      ),*/
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? AppColors.red
              : AppColors.font_light_gray),
    );
  }
}

// ignore: must_be_immutable
// slider declared

class Slider extends StatelessWidget {
  String image, title, description;

  //Constructor created
  Slider({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      // column containing image
      // title and description

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image), height: 299, width: 299),
          Padding(
            padding: const EdgeInsets.all(30.0),
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins Bold',
                  color: AppColors.black)),
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Text(
            description,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins Regular',
                color: AppColors.font_light_gray),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
