// ignore_for_file: unnecessary_new

class AuthModel {
  bool? status;
  String? message;
  Data? data;

  AuthModel({this.status, this.message, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? city;
  String? token;

  Data({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.city,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phone'];
    city = json['city'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['city'] = city;
    data['phoneNumber'] = phoneNumber;
    data['token'] = token;
    return data;
  }
}
