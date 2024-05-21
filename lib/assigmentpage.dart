import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartcampusloginpage/assigment.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:flutter/cupertino.dart';

class AssignmentPage1 extends StatelessWidget {
  AssignmentPage1({super.key,required this.topic,required this.subjectName,required this.id,required this.details,required this.startDate,required this.submissionDate,required this.submitted});
  final topic;
  final subjectName;
  final id;
  final details;
  final startDate;
  final submissionDate;
  final submitted;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom container at the top
              Container(
                height: height / 4,
                width: double.infinity,
                child: Stack(
                  children: [
                    // The SquareBox widget
                    SquareBox(
                      color1: Color(0xff6D4DBF),
                      color2: Color(0xff7E67D1),
                      height: height,
                      width: width,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height / 20,
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
                        'Assignments',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height / 9.9,
                      left: width / 12,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: height / 17,
                          width: height / 18,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    // App bar row
                  ],
                ),
              ),
              // Rest of the AssignmentPage content
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subjectName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height/25),
                    Text(
                      DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(submissionDate.toString())),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height/25),
                    Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Notes:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: height/25),
                    Text(
                      'Questions:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:height/40),
                    ListTile(
                      title: Text(topic),
                    ),

                    SizedBox(height: height/16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy').format(
                                DateTime.parse(submissionDate.toString())),
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
