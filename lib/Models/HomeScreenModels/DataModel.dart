


import 'HomeSliderModel.dart';
import 'RestuarntlistModel.dart';


class DataModel {
  final List<RestaurantsModel> list_restaurants;
  final List<HomeSliderModel> list_slider_images;

  DataModel({required this.list_restaurants, required this.list_slider_images});

  factory DataModel.fromjson(Map<String, dynamic> json) {

    return DataModel(

      list_restaurants: (json['restaurants'] as List)
            .map((singleItem) => RestaurantsModel.fromjson(singleItem))
            .toList(),

      list_slider_images:(json['slider_images'] as List)
            .map((singleItem) => HomeSliderModel.fromjson(singleItem))
            .toList(),
    );
  }
}