class FavoriteModel {
  List<DataItem>? data;
  String? message;
  bool? status;

  FavoriteModel({this.data, this.message, this.status});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data!.add(DataItem.fromJson(v['product']));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class DataItem {
  Product? product;

  DataItem({this.product});

  DataItem.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  String? description;
  int? id;
  String? image;
  List<String>? images;
  String? name;
  double? price;
  Seller? seller;
  String? tags;

  Product(
      {this.description,
      this.id,
      this.image,
      this.images,
      this.name,
      this.price,
      this.seller,
      this.tags});

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    image = json['image'];
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
    name = json['name'];
    price = json['price'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    tags = json['tags'];
  }
}

class Seller {
  String? city;
  String? email;
  String? fullName;
  int? id;
  String? phoneNumber;
  String? profilePic;

  Seller({
    this.city,
    this.email,
    this.fullName,
    this.id,
    this.phoneNumber,
    this.profilePic,
  });

  Seller.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    fullName = json['fullName'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    profilePic = json['profilePic'];
  }
}
