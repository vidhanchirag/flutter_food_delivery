

class HomeSliderModel{
  final String image_url;
  final int id;
  HomeSliderModel({required this.image_url, required this.id});

  factory HomeSliderModel.fromjson(Map<String, dynamic> json) {
    return HomeSliderModel(
      image_url: json['image_url'],
      id: json['id'],
    );
  }
}