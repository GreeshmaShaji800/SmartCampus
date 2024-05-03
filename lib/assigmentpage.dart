import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/assigment.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:flutter/cupertino.dart';
void main() {       
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssignmentPage1(),
      
    );
  }
}

class AssignmentPage1 extends StatelessWidget {
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BiologyPage(),));
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
              buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Biology',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height/25),
          Text(
            'March 5, 2024, 11:30 AM',
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
            title: Text('1) What do you mean by Amoeba?'),
          ),
          ListTile(
            title: Text('2) What is an organism?'),
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
                  'Due Date: March 8, 2024, 11:30 AM',
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
    );
  }
}
