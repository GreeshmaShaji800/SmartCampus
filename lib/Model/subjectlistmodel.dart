// To parse this JSON data, do
//
//     final subjectList = subjectListFromJson(jsonString);

import 'dart:convert';

SubjectList subjectListFromJson(String str) => SubjectList.fromJson(json.decode(str));

String subjectListToJson(SubjectList data) => json.encode(data.toJson());

class SubjectList {
  List<Result> result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  SubjectList({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory SubjectList.fromJson(Map<String, dynamic> json) => SubjectList(
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
  int parentSubjectId;
  String subjectCode;
  int subjectTypeId;
  int displayOrder;
  int subjectGroupId;
  int parentCombinedSubject;

  Result({
    required this.id,
    required this.name,
    required this.parentSubjectId,
    required this.subjectCode,
    required this.subjectTypeId,
    required this.displayOrder,
    required this.subjectGroupId,
    required this.parentCombinedSubject,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    parentSubjectId: json["parentSubjectId"],
    subjectCode: json["subjectCode"],
    subjectTypeId: json["subjectTypeId"],
    displayOrder: json["displayOrder"],
    subjectGroupId: json["subjectGroupId"],
    parentCombinedSubject: json["parentCombinedSubject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "parentSubjectId": parentSubjectId,
    "subjectCode": subjectCode,
    "subjectTypeId": subjectTypeId,
    "displayOrder": displayOrder,
    "subjectGroupId": subjectGroupId,
    "parentCombinedSubject": parentCombinedSubject,
  };
}
