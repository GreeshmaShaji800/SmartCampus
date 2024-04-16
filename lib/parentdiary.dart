import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/Hwandassignment.dart';
import 'package:smartcampusloginpage/homescreen.dart';

class ParentHome extends StatelessWidget {
  const ParentHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() ,));
              },
              child: Icon(Icons.arrow_back)),
          onPressed: () {
            // Add your navigation logic here
          },
          color: Colors.white,
        ),
        title: Text(
          "Parent Diary",
          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),

            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HW(),));
              },
              child: Expanded(
                child: Container(
                  height: 325,
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
                  child: Center(
                    child: Text("HW & Assignments"),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: Container(
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
                child: Center(
                  child: Text("Leave Application"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
