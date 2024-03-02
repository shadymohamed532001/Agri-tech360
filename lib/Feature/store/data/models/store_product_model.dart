class StoreProductModel {
  final int id;
  final String description;
  final String image;
  final List<String> images;
  final String name;
  final double price;
  final Seller seller;
  final String tags;

  StoreProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.images,
    required this.name,
    required this.price,
    required this.seller,
    required this.tags,
  });

  factory StoreProductModel.fromJson(Map<String, dynamic> json) {
    return StoreProductModel(
      id: json['id'],
      description: json['description'],
      image: json['image'],
      images: List<String>.from(json['images']),
      name: json['name'],
      price: json['price'].toDouble(),
      seller: Seller.fromJson(json['seller']),
      tags: json['tags'],
    );
  }
}

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
