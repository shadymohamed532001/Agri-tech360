class ExplorDataModel {
  final String plantName;
  final String plantShortDescription;
  final String plantLongDescription;
  final String minimumdegrees;
  final String maxmumdegrees;
  final String stateofTemperature;
  final String numberOfWater;

  final String plantimagepath;

  ExplorDataModel({
    required this.numberOfWater,
    required this.stateofTemperature,
    required this.maxmumdegrees,
    required this.minimumdegrees,
    required this.plantLongDescription,
    required this.plantName,
    required this.plantShortDescription,
    required this.plantimagepath,
  });
}
