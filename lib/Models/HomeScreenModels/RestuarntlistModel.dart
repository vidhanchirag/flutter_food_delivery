
class RestaurantsModel{
  final String image_url;
  final int  id;
  final String restaurant_name,restaurant_type,delivery_type,ratings,given_stars;

  RestaurantsModel({required this.image_url, required this.id,required this.restaurant_name,required this.restaurant_type,
    required this.delivery_type,required this.ratings,required this.given_stars});

  factory RestaurantsModel.fromjson(Map<String, dynamic> json) {
    return RestaurantsModel(
      image_url: json['image_url'],
      id: json['id'],
      restaurant_name: json['restaurant_name'],
      restaurant_type: json['restaurant_type'],
      delivery_type: json['delivery_type'],
      ratings: json['ratings'],
      given_stars: json['given_stars'],
    );
  }
}