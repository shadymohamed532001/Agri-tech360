class CommentModel {
  Data? data;
  String? message;
  bool? status;

  CommentModel({this.data, this.message, this.status});

  CommentModel.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  Commenter? commenter;
  String? prediction;
  Product? product;

  Data({this.comment, this.commenter, this.prediction, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    commenter = json['commenter'] != null
        ? Commenter.fromJson(json['commenter'])
        : null;
    prediction = json['prediction'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    if (commenter != null) {
      data['commenter'] = commenter!.toJson();
    }
    data['prediction'] = prediction;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Commenter {
  String? city;
  String? email;
  String? fullName;
  int? id;
  String? phoneNumber;
  String? profilePic;

  Commenter(
      {this.city,
      this.email,
      this.fullName,
      this.id,
      this.phoneNumber,
      this.profilePic});

  Commenter.fromJson(Map<String, dynamic> json) {
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

class Product {
  String? description;
  int? id;
  String? image;
  String? images;
  String? name;
  int? price;
  Commenter? seller;
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
    seller = json['seller'] != null ? Commenter.fromJson(json['seller']) : null;
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
