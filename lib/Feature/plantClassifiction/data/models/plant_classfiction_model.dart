class Seller {
  final int id;
  final String city;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String profilePic;

  Seller({
    required this.id,
    required this.city,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profilePic,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['id'],
      city: json['city'],
      email: json['email'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      profilePic: json['profilePic'],
    );
  }
}

class Product {
  final int id;
  final String description;
  final String image;
  // final List<String> images;
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  Product({
    required this.id,
    required this.description,
    required this.image,
    // required this.images,
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
      // images: json['images'] != null ? List<String>.from(json['images']) : [],
      name: json['name'],
      price: json['price'].toDouble(),
      seller: Seller.fromJson(json['seller']),
      tags: json['tags'],
    );
  }
}

class ClassfictionModel {
  final bool status;
  final String message;
  final double confidence;
  final String image;
  final String predictions;
  final List<List<Product>> products;

  ClassfictionModel({
    required this.status,
    required this.message,
    required this.confidence,
    required this.image,
    required this.predictions,
    required this.products,
  });

  factory ClassfictionModel.fromJson(Map<String, dynamic> json) {
    return ClassfictionModel(
      status: json['status'],
      message: json['message'],
      confidence: json['data']['confidence'],
      image: json['data']['image'],
      predictions: json['data']['predictions'],
      products: List<List<Product>>.from(
        json['data']['products'].map<List<Product>>(
          (products) => List<Product>.from(
            products.map((product) => Product.fromJson(product)),
          ),
        ),
      ),
    );
  }
}
