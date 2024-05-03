import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:smartcampusloginpage/homescreen.dart';

import 'squrebox.dart';

void main() {
  // Lock the orientation to landscape mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimetablePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final List<String> periods = ["1st Period", "2nd Period", "3rd Period", "4th Period", "5th Period", "6th Period", "7th Period", "8th Period"];
  final List<String> subjects = ["Math", "Science", "English", "History", "Art", "Music", "Biology", "Chemistry"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.20),
        child: Column(
          children: [
            // Top container mimicking the AppBar
            Container(
              height: height / 4,
              width: double.infinity,
              child: Stack(
                children: [
                  // SquareBox widget
                  SquareBox(
                    color1: Color(0xff6D4DBF),
                    color2: Color(0xff7E67D1),
                    height: height,
                    width: width,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 35,
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
                      'Class Timetable',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Positioned(
                    top: height/9.9,
                    left: width/12,
                    child: Container(
                      height: height/17,
                      width: height/18,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                        },

                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            // Horizontal scrollable DataTable
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                columnSpacing: 20.0,
                columns: [
                  DataColumn(label: Text('Day/Period')),
                  for (var period in periods) DataColumn(label: Text(period)),
                ],
                rows: [
                  for (int i = 0; i < days.length; i++)
                    DataRow(
                      cells: [
                        DataCell(Text(days[i])), // Populated day names
                        for (var _ in periods)
                          DataCell(
                            Center(
                              child: Text(
                                generateTimetableEntry(),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String generateTimetableEntry() {
    var rng = Random();
    var subject = subjects[rng.nextInt(subjects.length)];
    return subject;
  }
}