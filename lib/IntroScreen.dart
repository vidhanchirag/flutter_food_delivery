import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'utils/AppColors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/intro_screen_1.png"),
        title: "All your favorites",
        body:
            "Order from the best local restaurants with\neasy, on-demand delivery.",
        footer: Text(""),
      ),
      PageViewModel(
        image: Image.asset("assets/intro_screen_2.png"),
        title: "All your favorites",
        body:
            "Order from the best local restaurants with\neasy, on-demand delivery.",
        footer: Text(""),
      ),
      PageViewModel(
        image: Image.asset("assets/intro_screen_3.png"),
        title: "Choose your food",
        body:
            "Easily find your type of food craving and\n you'll get delivery in wide range.",
        footer: Text(""),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PageBackgroundcolor,
      /*appBar: AppBar(
        title: Text("Introduction Screen"),
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: IntroductionScreen(
            globalBackgroundColor: AppColors.PageBackgroundcolor,
            pages: getPages(),
            showDoneButton: true,
            showNextButton: true,
            showSkipButton: true,
            skip: Text(""),
            done: Text("Next"),
            next: Text(""),
            onDone: () {},
          ),
        ),
      ),
    );
  }
}
