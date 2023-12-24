class WeatherModels {
  final String day;
  final String minTemperature;
  final String maxTemperature;

  WeatherModels({
    required this.day,
    required this.minTemperature,
    required this.maxTemperature,
  });
  factory WeatherModels.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModels(
      day: data['current']['last_updated'],
      minTemperature: jsonData['mintemp_c'],
      maxTemperature: jsonData['maxtemp_c'],
    );
  }
}
