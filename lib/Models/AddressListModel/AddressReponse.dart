

import 'AddressDataModel.dart';


class AddressReponse{
  final  bool success;
  final String msg;

  final List<AddressDataModel> list_data;

  AddressReponse({required this.success, required this.msg, required this.list_data});

  factory AddressReponse.fromjson(Map<String, dynamic> json) {
    return AddressReponse(
        success: json['success'],
        msg: json['message'],
       list_data: (json['data'] as List)
        .map((singleItem) => AddressDataModel.fromjson(singleItem))
        .toList(),
    );
  }
}