// To parse this JSON data, do
//
//     final apiData = apiDataFromJson(jsonString);

import 'dart:convert';

ApiDataModel apiDataFromJson(String str) => ApiDataModel.fromJson(json.decode(str));

String apiDataToJson(ApiDataModel data) => json.encode(data.toJson());

class ApiDataModel {
  ApiDataModel({
    this.status,
    this.message,
    this.result,
  });

  bool? status;
  String? message;
  Result? result;

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.availabilityStatus,
  });

  String? availabilityStatus;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    availabilityStatus: json["availability_status"],
  );

  Map<String, dynamic> toJson() => {
    "availability_status": availabilityStatus,
  };
}
