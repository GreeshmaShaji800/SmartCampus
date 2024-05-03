// To parse this JSON data, do
//
//     final email = emailFromJson(jsonString);

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));

String emailToJson(Email data) => json.encode(data.toJson());

class Email {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  Email({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
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
  int tenantId;
  String firstName;
  String middleName;
  String lastName;
  String admissionNo;
  String batchName;
  DateTime admissionDate;
  int age;
  DateTime dateOfBirth;
  dynamic temporaryAddress;
  dynamic permanentAddress;
  dynamic aadhaarNo;
  int batchId;
  dynamic studentImageId;
  int religionMasterId;
  int casteId;
  int categoryId;
  bool isDefaulterStudent;
  String dobString;
  String studentName;
  String casteOther;
  int currentTermId;
  String rollNos;
  int rollNo;
  bool isJoined;
  int termId;
  int institutionId;
  String institutionName;
  String email;
  dynamic bloodGroupName;
  String contactNo;
  dynamic studContactNo;
  bool imageExist;
  String fatherName;
  String motherName;
  dynamic fatherContactNumber;
  dynamic motherContactNumber;
  int id;

  Item({
    required this.tenantId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.admissionNo,
    required this.batchName,
    required this.admissionDate,
    required this.age,
    required this.dateOfBirth,
    required this.temporaryAddress,
    required this.permanentAddress,
    required this.aadhaarNo,
    required this.batchId,
    required this.studentImageId,
    required this.religionMasterId,
    required this.casteId,
    required this.categoryId,
    required this.isDefaulterStudent,
    required this.dobString,
    required this.studentName,
    required this.casteOther,
    required this.currentTermId,
    required this.rollNos,
    required this.rollNo,
    required this.isJoined,
    required this.termId,
    required this.institutionId,
    required this.institutionName,
    required this.email,
    required this.bloodGroupName,
    required this.contactNo,
    required this.studContactNo,
    required this.imageExist,
    required this.fatherName,
    required this.motherName,
    required this.fatherContactNumber,
    required this.motherContactNumber,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    tenantId: json["tenantId"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    admissionNo: json["admissionNo"],
    batchName: json["batchName"],
    admissionDate: DateTime.parse(json["admissionDate"]),
    age: json["age"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    temporaryAddress: json["temporaryAddress"],
    permanentAddress: json["permanentAddress"],
    aadhaarNo: json["aadhaarNo"],
    batchId: json["batchId"],
    studentImageId: json["studentImageId"],
    religionMasterId: json["religionMasterId"],
    casteId: json["casteId"],
    categoryId: json["categoryId"],
    isDefaulterStudent: json["isDefaulterStudent"],
    dobString: json["dobString"],
    studentName: json["studentName"],
    casteOther: json["casteOther"],
    currentTermId: json["currentTermId"],
    rollNos: json["rollNos"],
    rollNo: json["rollNo"],
    isJoined: json["isJoined"],
    termId: json["termId"],
    institutionId: json["institutionId"],
    institutionName: json["institutionName"],
    email: json["email"],
    bloodGroupName: json["bloodGroupName"],
    contactNo: json["contactNo"],
    studContactNo: json["studContactNo"],
    imageExist: json["imageExist"],
    fatherName: json["fatherName"],
    motherName: json["motherName"],
    fatherContactNumber: json["fatherContactNumber"],
    motherContactNumber: json["motherContactNumber"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tenantId": tenantId,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "admissionNo": admissionNo,
    "batchName": batchName,
    "admissionDate": admissionDate.toIso8601String(),
    "age": age,
    "dateOfBirth": dateOfBirth.toIso8601String(),
    "temporaryAddress": temporaryAddress,
    "permanentAddress": permanentAddress,
    "aadhaarNo": aadhaarNo,
    "batchId": batchId,
    "studentImageId": studentImageId,
    "religionMasterId": religionMasterId,
    "casteId": casteId,
    "categoryId": categoryId,
    "isDefaulterStudent": isDefaulterStudent,
    "dobString": dobString,
    "studentName": studentName,
    "casteOther": casteOther,
    "currentTermId": currentTermId,
    "rollNos": rollNos,
    "rollNo": rollNo,
    "isJoined": isJoined,
    "termId": termId,
    "institutionId": institutionId,
    "institutionName": institutionName,
    "email": email,
    "bloodGroupName": bloodGroupName,
    "contactNo": contactNo,
    "studContactNo": studContactNo,
    "imageExist": imageExist,
    "fatherName": fatherName,
    "motherName": motherName,
    "fatherContactNumber": fatherContactNumber,
    "motherContactNumber": motherContactNumber,
    "id": id,
  };
}
