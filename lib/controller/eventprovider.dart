import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Model/eventmodel.dart';

class EventProvider extends ChangeNotifier{
  var Token;
  var eventData;
  var institutionId;
  var eventList;
  var eventListData;
  Welcome? data;
  bool isLoginned=false;



  Future<void> getEventData()async {
    var Url = 'https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetEventsForMobileAPI';
    var uri = Uri.parse(Url);
    var response = await http.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $Token'
    },
        body: jsonEncode(<String, dynamic>{
          "institutionId": "1",
          "batchId": "63",
          "isWeeklyOffDay": "true",
          "maxResultCount": "1000",
          "StartDate": "2024/01/01",
          "EndDate": "2025/03/31"
        })
    );
    if (response.statusCode == 200) {
      isLoginned=true;
      eventData = jsonDecode(response.body);
      print('*********** $eventData');
      var event = welcomeFromJson(response.body);
      data = welcomeFromJson(response.body);
      var fromdate = event.result.items[0].start;
      print('startdate:${fromdate}');
      print(data!.result.items[0].title);
    }
   }}
