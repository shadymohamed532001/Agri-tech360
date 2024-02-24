class PlantCareModel {
  Data? data;
  String? message;
  bool? status;

  PlantCareModel({this.data, this.message, this.status});

  PlantCareModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? confidence;
  String? image;
  String? predictions;
  List<dynamic>? products;

  Data({this.confidence, this.image, this.predictions, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    image = json['image'];
    predictions = json['predictions'];
    products = json['products'] != null ? List<dynamic>.from(json['products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['confidence'] = confidence;
    data['image'] = image;
    data['predictions'] = predictions;
    data['products'] = products;
    return data;
  }
}
