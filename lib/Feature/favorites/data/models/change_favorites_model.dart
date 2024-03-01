class AddOrRemoveFavorite {
  Data? data;
  String? message;
  bool? status;

  AddOrRemoveFavorite({this.data, this.message, this.status});

  AddOrRemoveFavorite.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Product? product;
  User? user;

  Data({this.product, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Product {
  String? description;
  int? id;
  String? image;
  String? images;
  String? name;
  int? price;
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
    images = json['images'];
    name = json['name'];
    price = json['price'];
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['images'] = this.images;
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    data['tags'] = this.tags;
    return data;
  }
}

class Seller {
  String? city;
  String? email;
  String? fullName;
  int? id;
  String? phoneNumber;
  String? profilePic;

  Seller(
      {this.city,
      this.email,
      this.fullName,
      this.id,
      this.phoneNumber,
      this.profilePic});

  Seller.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    fullName = json['fullName'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePic'] = this.profilePic;
    return data;
  }
}

class User {
  String? city;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? profilePic;

  User(
      {this.city,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
