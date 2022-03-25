import 'package:flutter/material.dart';
import 'package:food_delivery/screens/orders/YourOrderScreen.dart';
import 'package:food_delivery/screens/singlerestaurant/SingleRestaurantScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool value = false;
  bool value1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      body: SingleChildScrollView(
        child: Column(
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
                        child: Image.asset('assets/header_image.png'),
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
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SingleRestaurantScreen()),
                              );
                            },
                            child: Image.asset(
                              "assets/back.png",
                              height: 25,
                              width: 25,
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
                    "Cookies Sandwich",
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
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'Shortbread, chocolate turtle cookies, and red velvet. 8 ounces cream cheese, softened.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    '\$\$ - Chinese - American - Deshi Food',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.font_light_gray,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Regular',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 0,bottom: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Choice of top Cookie",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.0,
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 50, right: 20),
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Required".toUpperCase(),
                                    style: TextStyle(
                                      color: AppColors.requird_button_color,
                                      fontSize: 12.0,
                                      fontFamily: 'Poppins Medium',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    primary: AppColors.button_color,
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
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(width: 1.0, color: Colors.red),
                                    ),
                                    value: value,
                                    activeColor: AppColors.red,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.value = value!;
                                      });
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Chocolate Chip',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.font_light_gray,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Regular',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'USD7.4',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins SemiBold',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.divider_color,
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 0.0, right: 0,bottom: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Choice of Bottom Cookie",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.0,
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 40, right: 20),
                                height: 32,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Required".toUpperCase(),
                                    style: TextStyle(
                                      color: AppColors.requird_button_color,
                                      fontSize: 12.0,
                                      fontFamily: 'Poppins Regular',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    primary: AppColors.button_color,
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
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(width: 1.0, color: Colors.red),
                                    ),
                                    value: value1,
                                    activeColor: AppColors.red,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.value1 = value!;
                                      });
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Chocolate Chip',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 14.0,
                                        fontFamily: 'Poppins Regular',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'USD7.4',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.red,
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins SemiBold',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.divider_color,
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15,bottom: 15),
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        height:20,
                        width: 20,
                        decoration: BoxDecoration(
                            //color: AppColors.Gray_light,
                            borderRadius: BorderRadius.circular(100)
                          //more than 50% of width makes circle
                        ),
                        child: Image.asset("assets/minus.png",height: 25,width: 25,),
                      ),
                      SizedBox(
                        width: 70,
                        height: 25,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '01',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 21.0,
                              fontFamily: 'Poppins Medium',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height:20,
                        width: 20,
                        decoration: BoxDecoration(
                           // color: AppColors.Gray_light,
                            borderRadius: BorderRadius.circular(100)
                          //more than 50% of width makes circle
                        ),
                        child: Image.asset("assets/plus.png",fit:BoxFit.cover,height: 15,width: 13),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30.0,top: 30.0,right: 30.0,bottom: 30),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> YuorOrderScreen()),
                      );
                    },
                    child: Text(
                      'Add to Order'.toUpperCase()+" (\$11.98)",
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
          ],
        ),
      ),
    );
  }
}
