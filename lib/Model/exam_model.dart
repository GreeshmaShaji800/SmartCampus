// To parse this JSON data, do
//
//     final examModel = examModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

ExamModel examModelFromJson(String str) => ExamModel.fromJson(json.decode(str));

String examModelToJson(ExamModel data) => json.encode(data.toJson());

class ExamModel {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  ExamModel({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
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
  List<Item> items;

  Result({
    required this.items,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  int studentId;
  dynamic examId;
  String examName;
  List<MarkList> markList;

  Item({
    required this.studentId,
    required this.examId,
    required this.examName,
    required this.markList,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    studentId: json["studentId"],
    examId: json["examId"],
    examName: json["examName"],
    markList: List<MarkList>.from(json["markList"].map((x) => MarkList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "examId": examId,
    "examName": examName,
    "markList": List<dynamic>.from(markList.map((x) => x.toJson())),
  };
}

class MarkList {
  int subjectId;
  String subjectName;
  dynamic passMark;
  dynamic maximumMark;
  dynamic result;
  dynamic mark;
  int grade;

  MarkList({
    required this.subjectId,
    required this.subjectName,
    required this.passMark,
    required this.maximumMark,
    required this.result,
    required this.mark,
    required this.grade,
  });

  factory MarkList.fromJson(Map<String, dynamic> json) => MarkList(
    subjectId: json["subjectId"],
    subjectName: json["subjectName"],
    passMark: json["passMark"],
    maximumMark: json["maximumMark"],
    result: json["result"],
    mark: json["mark"],
    grade: json["grade"],
  );

  Map<String, dynamic> toJson() => {
  "subjectId": subjectId,
  "subjectName": subjectName,
  "passMark": passMark,
  "maximumMark": maximumMark,
  "result": result,
  "mark": mark,
  "grade":grade,
  };
}
