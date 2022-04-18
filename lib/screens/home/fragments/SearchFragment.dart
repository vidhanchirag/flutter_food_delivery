import 'package:flutter/material.dart';
import 'package:food_delivery/utils/AppColors.dart';

import '../../../Models/HomeScreenModels/HomeModelResponse.dart';
import '../../../Models/HomeScreenModels/RestuarntlistModel.dart';
import '../../../utils/Appconfig.dart';
import '../../../utils/ToastMsg.dart';
import '../../../utils/constant.dart';
import '../../../utils/lodingindicator.dart';
import 'package:shimmer/shimmer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  _SearchFragmentState createState() => _SearchFragmentState();
}



class _SearchFragmentState extends State<SearchFragment> {
  List<RestaurantsModel> listImages = [];
  bool isLoading = false;
  final toastmsg = ToastMsg();
  bool is_show_list = false;
  bool is_loader = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.White,
      resizeToAvoidBottomInset: false,
      body: Center(
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
                             width: 30.0,
                             height: 30.0,
                             color: Colors.white,
                           ),
                           Padding(
                             padding:
                             const EdgeInsets.only(left: 10.0),
                             child: Container(
                               width: 100,
                               height: 40.0,
                               color: Colors.white,
                             ),
                           ),
                         ],
                       ),

                       Padding(
                         padding:
                         const EdgeInsets.only(top: 20.0),
                         child: Container(
                           width: 150,
                           height: 40.0,
                           color: Colors.white,
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
                           itemCount: 10,
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
             visible:  is_show_list ,
             child: Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10,top: 50),
               child: Column(
                 children: [

                   SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                         Row(
                           children: [
                             Image.asset(
                               'assets/search.png',height: 35,width: 35,
                             ),
                             Text(
                               "Search",
                               style: TextStyle(
                                 color: AppColors.black,
                                 fontSize: 24.0,
                                 fontFamily: 'Poppins SemiBold ',
                               ),
                             ),
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0,left: 5),
                           child: Text(
                             "Top Categories",
                             textAlign: TextAlign.left,
                             style: TextStyle(
                               color: AppColors.black,
                               fontSize: 16.0,
                               fontFamily: 'Poppins Regular',
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                           child: Container(
                             child: GridView.builder(
                                 padding: EdgeInsets.zero,
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               scrollDirection: Axis.vertical,
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                               ),
                               itemCount: listImages.length,
                               itemBuilder: (context, index) {
                                 return Container(
                                   color: Colors.white,
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
                                                       child: Container(
                                                         decoration: new BoxDecoration(
                                                           image: new DecorationImage(
                                                               image: new NetworkImage(listImages[index].image_url),
                                                               fit: BoxFit.cover),
                                                         ),
                                                       ),
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
                                               Align(
                                                 alignment: Alignment.center,
                                                 child: Text(
                                                   listImages[index].restaurant_name,
                                                   style: TextStyle(
                                                     color: AppColors.White,
                                                     fontSize: 16.0,
                                                     fontFamily: 'Poppins SemiBold ',
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
                 ],
               ),
             ),
           ),
          // Visibility(visible: isLoading, child: LoadingIndicator.isLoding()),
         ],

       ),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constant.isInternetAvailable().then((IsConnected) async {
      if (IsConnected) {
      //  onLoaderShow();
        get_home_page_data();
      } else {
        toastmsg.showToast(Appconfig.network_error, context);
      }
    });
  }



  Future get_home_page_data() async {
    Map _params = {
      'radius': '10',
      'latitude': Constant.latitude,
      'longitude': Constant.longitude
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
          // onLoaderDismiss();
          if (is_loader == true) {
            is_loader=false;
            is_show_list=true;
            setState(() {
              is_loader;
              is_show_list;
            });
          }
          listImages = response.data.list_restaurants;
        } else {
          // onLoaderDismiss();
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
