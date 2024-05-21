import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../Model/model_class2.dart';

class staffprovider extends ChangeNotifier{
  var name;
  var Token;
  var staffdata;
  var institutionId;

  Staff? data;




  Future<void> getStaffData()async{
    var Url = 'https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetTeachersListOfABatch4MobileAPI';
    var uri = Uri.parse(Url);
    var response =await http.post(uri,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $Token'
    },
      body: jsonEncode(<String,dynamic>{
        "institutionId": "1",
        "batchId": "63",
        "TermId":"39"
      })

    );
    if (response. statusCode==200){
     staffdata = staffFromJson(response.body);
     print('%%%%%%%%%%%%%% ${response.body}');
     var staffdata1=staffFromJson(response.body);
     data=staffFromJson(response.body);
     // institutionId=staffdata1.result.items[0].institutionId;
      print(staffdata1.result[0].name);



    }notifyListeners();
  }

}