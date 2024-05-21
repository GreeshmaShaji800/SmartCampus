

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/squrebox.dart';

import 'assigmentpage.dart';


class BiologyPage extends StatelessWidget {
  BiologyPage({super.key,required this.id,required this.subjectName});

  final id;
  final subjectName;


  var isCompleted = true;
  var secondassignment = true;
  @override
  Widget build(BuildContext context) {
    final assignmentList=Provider.of<userprovide>(context);
    List<Map<String,dynamic>> assignmentdata1=[];
    List<Map<String,dynamic>> assignmentlist=[];

    for (int i = 0; i < assignmentList.assignmentdata2.length; i++) {
      if(assignmentList.assignmentdata2[i]['id']==id)
      {

        assignmentdata1 = [
          {
            'subjectName': assignmentList.assignmentdata2[i]['subjectName'],
            'id':assignmentList.assignmentdata2[i]['id'],
            'title': assignmentList.assignmentdata2[i]['title'],
            'details': assignmentList.assignmentdata2[i]['details'],
            'startDate': assignmentList.assignmentdata2[i]['startDate'],
            'submissionDate': assignmentList.assignmentdata2[i]['submissionDate'],
            'submitted': assignmentList.assignmentdata2[i]['submitted']
          }
        ];
        assignmentlist.addAll(assignmentdata1);}
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height / 4,
            width: double.infinity,
            color: Color(0xff6D4DBF),
            child: Stack(
              children: [
                SquareBox(
                  color1: Color(0xff6D4DBF),
                  color2: Color(0xff7E67D1),
                  height: height,
                  width: width,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height / 25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    subjectName,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Positioned(
                  top: height / 9.9,
                  left: width / 12,
                  child: Container(
                    height: height / 17,
                    width: height / 17,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Assignmentpage(),
                                ));
                          },
                          child: Icon(Icons.arrow_back_ios,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(itemCount:assignmentlist.length,itemBuilder: (context, index) {
              isCompleted=assignmentlist[index]['submitted'];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage1(details: assignmentlist[index]['details'],id: assignmentlist[index]['id'] ,startDate:  assignmentlist[index]['startDate'],subjectName: assignmentlist[index]['subjectName'],submissionDate: assignmentlist[index]['submissionDate'],submitted:  assignmentlist[index]['submitted'],topic:  assignmentlist[index]['title'],)),);
                },
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            assignmentlist[index]['title'],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('Due  ${DateFormat('dd/MM/yyyy').format(
                              DateTime.parse(assignmentlist[index]['submissionDate'].toString()))}'),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: isCompleted == true ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: isCompleted == true
                                  ? Text(
                                'Completed',
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              )
                                  : Text(
                                'Pending',
                                style:
                                TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              );
            }),
          )


        ],
      ),
    );
  }
}



class Assignmentpage extends StatelessWidget {
  Assignmentpage({Key? key});

  @override
  Widget build(BuildContext context) {
    final sujectList=Provider.of<userprovide>(context);
    Map<int,dynamic> Subjects= {
      for(int i = 0; i < sujectList.assignmentdata2.length; i++)

        sujectList.assignmentdata2[i]['id']:sujectList.assignmentdata2[i]['subjectName'],
    };
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: height / 4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
              child: Stack(
                children: [
                  SquareBox(
                    color1: Color(0xff6D4DBF),
                    color2: Color(0xff7E67D1),
                    height: height,
                    width: width,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Assignment',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: height / 9.9,
                    left: width / 12,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Container(
                        height: height / 17,
                        width: height / 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Subjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BiologyPage(id: Subjects.keys.toList()[index],subjectName:  Subjects[ Subjects.keys.toList()[index]], )),
                        );
                      },
                      child: Container(
                        height: height / 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Subjects[ Subjects.keys.toList()[index]],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}