class Weathermodel {
  List<Result>? result;

  Weathermodel({this.result});

  factory Weathermodel.fromJson(Map<String, dynamic> json) => Weathermodel(
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Result {
  late num? maxCelsius, minCelsius;
  late String? icon, date;

  Result({this.minCelsius, this.maxCelsius, this.date, this.icon});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        minCelsius: (json['minCelsius'] as num?)?.toDouble(),
        maxCelsius: (json['maxCelsius'] as num?)?.toDouble(),
        date: json['date'] as String?,
        icon: json['icon'] as String?,
      );
}
