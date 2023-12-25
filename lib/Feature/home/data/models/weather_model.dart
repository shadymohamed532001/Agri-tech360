import 'package:intl/intl.dart';

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
      icon: _formatDate(json['date']),
    );
  }

  static String _formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    return DateFormat.MMMM().format(date);
  }
}
