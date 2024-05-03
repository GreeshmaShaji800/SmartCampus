import 'dart:convert';import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'Model/model_class.dart';

class userprovide extends ChangeNotifier{
  var name;
  var data;
  var Token;
  var userdata;
  var personaldata;
  var UserId;
  var Name;
  var profiledata;
  var Admission;
  var batchname;
  var religion;
  var adharno;
  var dateofbirth;
  var rollno;
  var contactno;
  var age;
  var address;
  var bloodgroup;
  var mothername;
  var fathername;
  var email;
  var academicyear;
  var batchid;
  Future<void> getProfileData()async{
    var Url = 'https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetUserDetailAfterLoginForMobileAPI';
    var uri = Uri.parse(Url);
    var response =await http.post(uri,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $Token'
    },);
    if (response. statusCode==200){
      personaldata = jsonDecode(response.body);
      print('*************************** $personaldata');
      UserId=personaldata['result']['user']['id'];
      // Name =personaldata['result']['user']['name'];
      print('@@@@@@@@@@@@@@@@  $UserId');

    }

  }
  Future<void> getProfilepagedata()async {
    var Url ='https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetStudentbyphoneAndRelationsForMobileAPI';
    var uri = Uri.parse(Url);
    var response =await http.post(uri,headers: <String, String>{

      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer $Token'
    },body: jsonEncode(<String,dynamic>{
      "UserId":UserId
    }));
    if (response.statusCode==200){
      profiledata = jsonDecode(response.body);
      print('&&&&&&&&&&&&&&& $profiledata');
      var profile=emailFromJson(response.body);
      //
       print('-------------------------------------${profile.result.items[0].email}');
      Name=profile.result.items[0].studentName;
      Admission=profile.result.items[0].admissionNo;
      batchname=profile.result.items[0].batchName;
      religion= profile.result.items[0].religionMasterId;
      adharno= profile.result.items[0].aadhaarNo ;
      dateofbirth=profile.result.items[0].dateOfBirth;
      rollno=profile.result.items[0].rollNo;
      age=profile.result.items[0].age;
      address=profile.result.items[0].permanentAddress;
      bloodgroup=profile.result.items[0].bloodGroupName;
      mothername=profile.result.items[0].motherName;
      fathername=profile.result.items[0].fatherName;
      email=profile.result.items[0].email;
      academicyear=profile.result.items[0].admissionDate;
      batchid=profile.result.items[0].batchId;








    }

  }
  // Future<void> getEmaildata()async {
  //   var Url ='hbxzbttps://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetStudentbyphoneAndRelationsForMobileAPI';
  //   var uri = Uri.parse(Url);
  //   var response =await http.post(uri,headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization':'Bearer $Token'
  //   },body: jsonEncode(<String,dynamic> {
  //     "UserId":UserId
  //   }));
  //   if (response.statusCode==200){
  //    // emaildata =
  //     var emaildat= emailFromJson(response.body);
  //     print('0000000000000000000000000000000000000000000000000${emaildat.result.items}');
  //     print('!!!!!!!!!!!!! $emaildata');
  //     Usergmail = emaildata ['result']['user']['email'];
  //   }
  // }
  // Future<void> getadmissiondata()async{
  //   var Url='https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetStudentbyphoneAndRelationsForMobileAPI';
  //   var uri =Uri.parse(Url);
  //   var response=await http.post(uri,headers: <String,String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization':'Bearer $Token'
  //   },body: jsonEncode(<String,dynamic>{
  //   "UserId":UserId
  //   }));
  //   if (response.statusCode==200){
  //     admissiondata = jsonDecode(response.body);
  //     print('%%%%%%%%%%%%%%% $admissiondata');
  //    useradmissionNo =admissiondata['result']['user']['admissionNo'];
  //
  //   }
  // }



}
