import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
            color: Colors.white,
          ),
          title: Text('Assignments'),

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple], // Blue to violet gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
        body: AssignmentPage(),
      ),
    );
  }
}

class AssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          SizedBox(height: 8),
          Text(
            'March 5, 2024, 11:30 AM',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.all(16),
            child: Text(
              'Notes: ',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Questions:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text('1) what do you mean by Amoeba?'),
          ),
          ListTile(
            title: Text('2) what is an organism?'),
          ),
          SizedBox(height: 16),
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
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle completion logic
                      },
                      child: Text('Completed'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle pending logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[100], // Red color for the pending button
                      ),
                      child: Text('Pending'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}