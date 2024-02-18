class PlantCareModle {
  final Data data;
  final String message;
  final bool status;

  PlantCareModle({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PlantCareModle.fromJson(Map<String, dynamic> json) {
    return PlantCareModle(
      data: Data.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }
}

class Data {
  final double confidence;
  final String predictions;

  Data({
    required this.confidence,
    required this.predictions,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      confidence: json['confidence'],
      predictions: json['predictions'],
    );
  }
}
