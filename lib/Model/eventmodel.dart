import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Result result;
  dynamic targetUrl;
  bool success;
  dynamic error;
  bool unAuthorizedRequest;
  bool abp;

  Welcome({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
  String title;
  String description;
  DateTime start;
  DateTime end;
  int eventOrHolidayType;
  int? batchId;
  Color color;
  dynamic url;
  dynamic styleClassForOffDay;
  int institutionId;
  int id;

  Item({
    required this.tenantId,
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.eventOrHolidayType,
    required this.batchId,
    required this.color,
    required this.url,
    required this.styleClassForOffDay,
    required this.institutionId,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    tenantId: json["tenantId"],
    title: json["title"],
    description: json["description"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    eventOrHolidayType: json["eventOrHolidayType"],
    batchId: json["batchId"],
    color: colorValues.map[json["color"]]!,
    url: json["url"],
    styleClassForOffDay: json["styleClassForOffDay"],
    institutionId: json["institutionId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tenantId": tenantId,
    "title": title,
    "description": description,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "eventOrHolidayType": eventOrHolidayType,
    "batchId": batchId,
    "color": colorValues.reverse[color],
    "url": url,
    "styleClassForOffDay": styleClassForOffDay,
    "institutionId": institutionId,
    "id": id,
  };
}

enum Color {
  EA8_C81,
  RGB_121197165
}

final colorValues = EnumValues({
  "#ea8c81": Color.EA8_C81,
  "rgb(121, 197, 165)": Color.RGB_121197165
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
    }
}
