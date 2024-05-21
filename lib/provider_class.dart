import 'dart:convert';import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'Model/assignmentmodel.dart';
import 'Model/model_class.dart';
import 'Model/subjectlistmodel.dart';

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
  var fathercontact;
  var Mothercontactno;
  var institutionId;
  var Institutionname;
  var Admissionnumber;
  var studentId;
  var termId;
  SubjectList? subjectModel;
  var assignmentdata;
  AssignmentData? assignment;
  List<Map<String,dynamic>> assignmentdata1=[];
  List<Map<String,dynamic>> assignmentdata2=[];
  var assignment1;





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
      fathercontact=profile.result.items[0].fatherContactNumber;
      Mothercontactno=profile.result.items[0].motherContactNumber;
      institutionId=profile.result.items[0].institutionId;
      Institutionname=profile.result.items[0].institutionName;
      studentId = profile.result.items[0].id;
      termId = profile.result.items[0].termId;









    }

  }

  Future<void> getSubjectList() async {
    var Url =
        'https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetSubjectTermListMappedToExamforMobileAPI';
    var uri = Uri.parse(Url);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $Token'
        },
        body: jsonEncode(
            <String, dynamic>{"TermId": termId, "BatchId": batchid}));
    if (response.statusCode == 200) {
      var subjectList = jsonDecode(response.body);
      subjectModel = subjectListFromJson(response.body);
      print('*********** $subjectList');
    }
  }


  Future<void> getAssignmentData(int subjectId) async {
    var Url =
        'https://sfsetr.smartcampus.co/api/services/app/HomeWorks/GetHomeWorksForGrid';
    var uri = Uri.parse(Url);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $Token'
        },
        body: jsonEncode(<String, dynamic>{
          "studentId": studentId,
          "subjectId": subjectId,
          "batchId": batchid,
          "institutionId": "1",
          "sorting": "Title"
        }));
    if (response.statusCode == 200) {
      assignment1=jsonDecode(response.body);
      var assignmentData = jsonDecode(response.body);
      //   print('*********** $assignmentData');
      var event = assignmentDataFromJson(response.body);
      assignment = assignmentDataFromJson(response.body);
      // print(assignment!.result.items.length);


      for (int i = 0; i < assignment!.result.items.length; i++) {
        assignmentdata1 = [
          {
            'subjectName': assignment!.result.items[i].subjectName,
            'id': assignment!.result.items[i].subjectId,
            'title': assignment!.result.items[i].title,
            'details': assignment!.result.items[i].details,
            'startDate': assignment!.result.items[i].releaseDate,
            'submissionDate': assignment!.result.items[i].submissionDate,
            'submitted': assignment!.result.items[i].submitted
          }
        ];
        assignmentdata2.addAll(assignmentdata1);
      }
      //  print(assignment!.result.items[i].subjectName);
      //  print("---------------------------------${assignmentdata1}");
      print("---------------------------------${assignmentdata2}");

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
