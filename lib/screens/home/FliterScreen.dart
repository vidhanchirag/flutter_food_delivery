import 'package:flutter/material.dart';
import 'package:food_delivery/utils/AppColors.dart';

import 'HomeScreen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Filters',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.font_red,
                        fontSize: 21.0,
                        fontFamily: 'Poppins SemiBold',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Clear all'.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.font_light_gray,
                        fontSize: 14.0,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.PageBackgroundcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 30, right: 15, bottom: 15),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Medium',
                    ),
                  ),
                ),
              ),
            ),

  GridView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => ItemTile(index),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),

            GridView.count(

              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                6,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 38,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.font_light_gray,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Center(
                          child: Text(
                            "Chinese".toUpperCase(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15,right: 15),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dietary'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins Medium',
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                6,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 38,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.font_light_gray,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Center(
                          child: Text(
                            "Vegetarian".toUpperCase(),
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 12.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15,right: 15),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'price range'.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins RMedium',
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(
                6,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.red
                        ),
                        child: Center(
                          child: Text(
                            "\$5".toUpperCase(),
                            style: TextStyle(
                              color: AppColors.White,
                              fontSize: 16.0,
                              fontFamily: 'Poppins Regular',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0,top: 50.0,right: 20.0,bottom: 30),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text(
                      'Apply filters'.toUpperCase(),
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
class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
      this.itemNo,
      );

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: color.withOpacity(0.3),
        onTap: () {},
        leading: Container(
          width: 50,
          height: 30,
          color: color.withOpacity(0.5),
          child: Placeholder(
            color: color,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
