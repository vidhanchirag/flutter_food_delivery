import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/addtocart/AddToCart.dart';
import 'package:food_delivery/screens/payment/AddPaymentScreen.dart';
import 'package:food_delivery/utils/AppColors.dart';
import 'package:food_delivery/utils/AppConstant.dart';

class YuorOrderScreen extends StatefulWidget {
  const YuorOrderScreen({Key? key}) : super(key: key);

  @override
  _YuorOrderScreenState createState() => _YuorOrderScreenState();
}

class _YuorOrderScreenState extends State<YuorOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.White,
          title: Text(
            'Your Orders',
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16.0,
              fontFamily: 'Poppins SemiBold',
            ),
          ),

          leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AddToCart()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.asset(
                                "assets/item_bg.png",
                                height: 82,
                                width: 114,
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cookie Sandwich',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Poppins Medium',
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          'Shortbread, chocolate turtle cookies, and red velvet.',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.font_light_gray,
                                            fontSize: 12.0,
                                            fontFamily: 'Poppins Regular',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Divider(
                            color: AppColors.divider_color,
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.8,
                      color: AppColors.box_border,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Image.asset("assets/percenatge_img.png",height: 20,width: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Apply Coupon',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins SemiBold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset("assets/forword_dark_arrow.png",height: 14,width: 9,),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Bill Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.0,
                    fontFamily: 'Poppins SemiBold',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0,right: 0,top: 5),
                child: Container(
                  height: 50,
                  color: AppColors.input_color,
                  width: MediaQuery.of(context).size.width,
                  /* decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.8,
                        color: AppColors.box_border,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),*/
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Subtotal',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Regular',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          '\$29.4  ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Regular',
                          ),

                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0,bottom: 0),
                child: Container(
                  height: 50,
                  color: AppColors.input_color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Delivery',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Regular',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          '\$0  ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Regular',
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 50,
                  color: AppColors.input_color,
                  /* decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.8,
                        color: AppColors.box_border,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),*/
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Total (incl. VAT)',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Medium',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          '\$29.4  ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16.0,
                            fontFamily: 'Poppins Medium',
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0.0,top: 20.0,right: 0.0,bottom: 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddPaymentScreen()),
                        );
                      },
                      child: Text(
                        "Checkout".toUpperCase()+" (\$11.98)",
                        style: TextStyle(
                          color: AppColors.White,
                          fontSize: 14.0,
                          fontFamily: 'Poppins Regular_w700',
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
      ),

    );
  }

}
