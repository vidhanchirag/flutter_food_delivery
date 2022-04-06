

import 'DataModel.dart';

class HomeModelResponse {
  final String success;
  final String msg;
  final DataModel data;


  HomeModelResponse({required this.success, required this.msg, required this.data});

  factory HomeModelResponse.fromjson(Map<String, dynamic> json) {
    return HomeModelResponse(
      success: json['success'],
      msg: json['message'],
      data:  DataModel.fromjson(json['data'])
    );
  }
}
