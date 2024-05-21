// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));

String staffToJson(Staff data) => json.encode(data.toJson());

class Staff {
  List<Result> result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  Staff({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    targetUrl: json["targetUrl"],
    success: json["success"],
    error: json["error"],
    unAuthorizedRequest: json["unAuthorizedRequest"],
    abp: json["__abp"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "targetUrl": targetUrl,
    "success": success,
    "error": error,
    "unAuthorizedRequest": unAuthorizedRequest,
    "__abp": abp,
  };
}

class Result {
  int id;
  String name;
  int teachingSubjectId;
  String teachingSubjectName;
  int batchId;
  String batchName;
  int institutionId;
  bool isTeachingStaff;

  Result({
    required this.id,
    required this.name,
    required this.teachingSubjectId,
    required this.teachingSubjectName,
    required this.batchId,
    required this.batchName,
    required this.institutionId,
    required this.isTeachingStaff,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    teachingSubjectId: json["teachingSubjectId"],
    teachingSubjectName: json["teachingSubjectName"],
    batchId: json["batchId"],
    batchName: json["batchName"],
    institutionId: json["institutionId"],
    isTeachingStaff: json["isTeachingStaff"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "teachingSubjectId": teachingSubjectId,
    "teachingSubjectName": teachingSubjectName,
    "batchId": batchId,
    "batchName": batchName,
    "institutionId": institutionId,
    "isTeachingStaff": isTeachingStaff,
  };
}
