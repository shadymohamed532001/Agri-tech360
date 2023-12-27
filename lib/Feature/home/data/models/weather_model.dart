class Weathermodel {
  final double minCelsius;
  final double maxCelsius;
  final String date;
  final String icon;

  Weathermodel({
    required this.minCelsius,
    required this.maxCelsius,
    required this.date,
    required this.icon,
  });

  factory Weathermodel.fromJson(Map<String, dynamic> json) {
    return Weathermodel(
      minCelsius: json['minCelsius'].toDouble(),
      maxCelsius: json['maxCelsius'].toDouble(),
      date: json['date'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'minCelsius': minCelsius,
      'maxCelsius': maxCelsius,
      'date': date,
      'icon': icon,
    };
  }
}
