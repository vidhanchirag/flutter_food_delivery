
class AddressDataModel{
  final int  id;
  final String address1,address2,landmark,city,state,country,mobile_no,zip_code;

  AddressDataModel({required this.id,required this.address1, required this.address2,required this.landmark,
    required this.city,required this.state,required this.country,required this.mobile_no,required this.zip_code});

  factory AddressDataModel.fromjson(Map<String, dynamic> json) {
    return AddressDataModel(
      id: json['id'],
      address1: json['address1'],
      address2: json['address2'],
      landmark: json['landmark'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      mobile_no: json['mobile_no'],
      zip_code: json['zip_code'],
    );
  }
}