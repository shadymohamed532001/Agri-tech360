class UserModel {
  Data? data;
  String? message;
  bool? status;

  UserModel({this.data, this.message, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  int? id;
  String? city;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? token;

  Data(
      {this.city,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.token,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    id = json['id'];
  }
}
