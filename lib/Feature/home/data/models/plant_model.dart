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

  PlantModle({
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
    };
  }
}
