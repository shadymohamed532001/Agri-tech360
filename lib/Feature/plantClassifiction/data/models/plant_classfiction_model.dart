class PlantClassficationMModel {
  final Data data;
  final String message;
  final bool status;

  PlantClassficationMModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PlantClassficationMModel.fromJson(Map<String, dynamic> json) {
    return PlantClassficationMModel(
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
