import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartcampusloginpage/assigmentpage.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';


class BiologyPage extends StatelessWidget {
  var isCompleted = true;
  var secondassignment = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                      'Biology',
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
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage1(),));
              },
              child: Container(
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
                      'Assignment 1',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Due April 20, 2024'),
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
            ),
            SizedBox(height: 30),
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
                    'Assignment 2',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due April 5, 2024'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      secondassignment == true ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: secondassignment == true
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
          ],
        ),
      ),
    );
  }
}

class EnglishPage extends StatelessWidget {
  var isCompleted = false;
  var secondassignment = true;
  var thirdassignment = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                      'English',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: height / 9.9,
                    left: width / 12,
                    child: Container(
                      height: height / 17,
                      width: height / 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
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
            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Assignment 3',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due April 20, 2024'),
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
                    'Assignment 2',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due April 5, 2024'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      secondassignment == true ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: secondassignment == true
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
                    'Assignment 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due March 20, 2024'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      thirdassignment == true ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: thirdassignment == true
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
          ],
        ),
      ),
    );
  }
}

class ChemistryPage extends StatelessWidget {
  var isCompleted = false;
  var secondassignment = true;
  var thirdassignment = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                      'Chemistry',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: height / 9.9,
                    left: width / 12,
                    child: Container(
                      height: height / 17,
                      width: height / 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
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
                    'Assignment 3',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due April 20, 2024'),
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
                    'Assignment 2',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due April 5, 2024'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      secondassignment == true ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: secondassignment == true
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
                    'Assignment 1',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('Due March 20, 2024'),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color:
                      thirdassignment == true ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: thirdassignment == true
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
          ],
        ),
      ),
    );
  }
}

class Assignmentpage extends StatelessWidget {
  Assignmentpage({Key? key});
  List Subjects = [
    'Biology',
    'English',
    'Chemistry',
  ];
  List SubjectPages = [BiologyPage(), EnglishPage(), ChemistryPage()];

  @override
  Widget build(BuildContext context) {
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
                              builder: (context) => SubjectPages[index]),
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
                              Subjects[index],
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