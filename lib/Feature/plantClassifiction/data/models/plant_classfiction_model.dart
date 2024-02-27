class ClassfictionModel {
  final Data data;
  final String message;
  final bool status;

  ClassfictionModel(
      {required this.data, required this.message, required this.status});

  factory ClassfictionModel.fromJson(Map<String, dynamic> json) {
    return ClassfictionModel(
      data: Data.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }
}

class Data {
  final double confidence;
  final String image;
  final String predictions;
  final List<Product> products;

  Data({
    required this.confidence,
    required this.image,
    required this.predictions,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    // Check if 'products' key exists and is not null
    final List<Product> products =
        json['products'] != null && json['products'] is List
            ? (json['products'] as List)
                .map((productJson) => Product.fromJson(productJson))
                .toList()
            : [];

    return Data(
      confidence: json['confidence'],
      image: json['image'],
      predictions: json['predictions'],
      products: products,
    );
  }
}

class Product {
  final int id;
  final String description;
  final String image;
  final List<String> images;
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  Product({
    required this.id,
    required this.description,
    required this.image,
    required this.images,
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      images:
          (json['images'] as List).map((image) => image.toString()).toList(),
      name: json['name'],
      price: json['price'].toDouble(),
      seller: Seller.fromJson(json['seller']),
      tags: json['tags'],
    );
  }
}

class Seller {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String city;
  final String profilePic;

  Seller({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.city,
    required this.profilePic,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      profilePic: json['profilePic'],
    );
  }
}
