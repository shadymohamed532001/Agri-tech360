class AddOrRemoveFavorite {
  Data? data;
  String? message;
  bool? status;

  AddOrRemoveFavorite({this.data, this.message, this.status});

  AddOrRemoveFavorite.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  Product? product;
  User? user;

  Data({this.product, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
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
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['image'] = image;
    data['images'] = images;
    data['name'] = name;
    data['price'] = price;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    data['tags'] = tags;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['email'] = email;
    data['fullName'] = fullName;
    data['id'] = id;
    data['phoneNumber'] = phoneNumber;
    data['profilePic'] = profilePic;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['profilePic'] = profilePic;
    return data;
  }
}
