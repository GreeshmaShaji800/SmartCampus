// To parse this JSON data, do
//
//     final assignmentData = assignmentDataFromJson(jsonString);

import 'dart:convert';

AssignmentData assignmentDataFromJson(String str) => AssignmentData.fromJson(json.decode(str));

String assignmentDataToJson(AssignmentData data) => json.encode(data.toJson());

class AssignmentData {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  AssignmentData({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory AssignmentData.fromJson(Map<String, dynamic> json) => AssignmentData(
    result: Result.fromJson(json["result"]),
    targetUrl: json["targetUrl"],
    success: json["success"],
    error: json["error"],
    unAuthorizedRequest: json["unAuthorizedRequest"],
    abp: json["__abp"],
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "targetUrl": targetUrl,
    "success": success,
    "error": error,
    "unAuthorizedRequest": unAuthorizedRequest,
    "__abp": abp,
  };
}

class Result {
  int totalCount;
  List<Item> items;

  Result({
    required this.totalCount,
    required this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    totalCount: json["totalCount"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  int subjectId;
  String title;
  dynamic remarks;
  String details;
  String subjectName;
  String attachmentFile;
  dynamic attachmentFiles;
  DateTime releaseDate;
  DateTime submissionDate;
  bool submitted;
  int institutionId;
  int id;

  Item({
    required this.subjectId,
    required this.title,
    required this.remarks,
    required this.details,
    required this.subjectName,
    required this.attachmentFile,
    required this.attachmentFiles,
    required this.releaseDate,
    required this.submissionDate,
    required this.submitted,
    required this.institutionId,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    subjectId: json["subjectId"],
    title: json["title"],
    remarks: json["remarks"],
    details: json["details"],
    subjectName: json["subjectName"],
    attachmentFile: json["attachmentFile"],
    attachmentFiles: json["attachmentFiles"],
    releaseDate: DateTime.parse(json["releaseDate"]),
    submissionDate: DateTime.parse(json["submissionDate"]),
    submitted: json["submitted"],
    institutionId: json["institutionId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "title": title,
    "remarks": remarks,
    "details": details,
    "subjectName": subjectName,
    "attachmentFile": attachmentFile,
    "attachmentFiles": attachmentFiles,
    "releaseDate": releaseDate.toIso8601String(),
    "submissionDate": submissionDate.toIso8601String(),
    "submitted": submitted,
    "institutionId": institutionId,
    "id": id,
  };
}
