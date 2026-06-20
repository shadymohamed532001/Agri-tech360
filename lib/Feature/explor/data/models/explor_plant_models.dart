import 'package:smartsoil/core/networking/end_boint.dart';

class PlantModle {
  final int id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String mediumDescription;
  final String careInstructions;
  final String minimumDegrees;
  final String waterRequirement;
  final String sunlightRequirement;
  final String plantImage_1;
  final String plantImage_2;

  PlantModle({
    required this.plantImage_1,
    required this.plantImage_2,
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.mediumDescription,
    required this.careInstructions,
    required this.minimumDegrees,
    required this.waterRequirement,
    required this.sunlightRequirement,
  });

  /// Returns a usable URL for image 1. If the API already returns a full
  /// (http/https) URL, it is used as-is; otherwise [baseUrl] is prepended.
  String get imageUrl1 => _resolveImageUrl(plantImage_1);

  /// Returns a usable URL for image 2. See [imageUrl1].
  String get imageUrl2 => _resolveImageUrl(plantImage_2);

  static String _resolveImageUrl(String path) {
    if (path.isEmpty) return path;
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return path;
    }
    return '$baseUrl$path';
  }

  factory PlantModle.fromJson(Map<String, dynamic> json) {
    return PlantModle(
      id: json['id'] as int,
      name: json['plantName'] as String,
      shortDescription: json['plantShortDescription'] as String,
      longDescription: json['plantLongDescription'] as String,
      mediumDescription: json['plantMediumDescription'] as String,
      careInstructions: json['plantCareInstruct'] as String,
      minimumDegrees: json['minimumdegrees'] as String,
      waterRequirement: json['numberOfWater'] as String,
      sunlightRequirement: json['stateofTemperature'] as String,
      plantImage_1: json['plantImage1'] as String,
      plantImage_2: json['plantImage2'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plantName': name,
      'plantShortDescription': shortDescription,
      'plantLongDescription': longDescription,
      'plantMediumDescription': mediumDescription,
      'plantCareInstruct': careInstructions,
      'minimumdegrees': minimumDegrees,
      'numberOfWater': waterRequirement,
      'stateofTemperature': sunlightRequirement,
      'plantImage1': plantImage_1,
      'plantImage2': plantImage_2,
    };
  }
}
