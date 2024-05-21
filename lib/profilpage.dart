import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/academicScreen.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/personalscreen.dart';
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:smartcampusloginpage/tokenclass/tokenpage.dart';
import 'package:http/http.dart' as http;
class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override

  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override

  Widget build(BuildContext context) {

    return AnimatedSplashScreen
      (splash: Image.asset('lib/assets/Parents-pana.png'),
        nextScreen: profilepage());
  }
}
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Consumer<userprovide>(builder: (context, value, child) =>  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height/2.4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
              child: Stack(
                children: [
                  SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                  Align(alignment: Alignment.bottomCenter
                    ,child: Container(
                      height: height/25,
                      width: double.infinity,
                      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      )),
                    ),
                  ),
                  Positioned(
                    top: height/15,right: width/2.5,
                    child: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                      ,fontSize: 25,),),
                  ),
                  Positioned(
                    top: height/16,
                    left: width/18,
                    child: Container(
                      height: height/17,
                      width: height/17,
                      decoration: BoxDecoration(border: Border.all(
                          color: Colors.grey
                      ),borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          },

                          child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                    ),
                  ),
                  Positioned(
                    top: height/7,left: width/7,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/img1.png'),
                    ),
                  ),
                  Positioned( top: height/6, right: width/4,
                    child: Text('Anu Emmnauel',style: TextStyle(fontSize: 20,
                      color: Colors.white,fontWeight: FontWeight.bold,),),
                  ),
                  Positioned(top: height/4, left: width/6,
                    child: Text('Batch',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                  Positioned( top: height/4,left: width/2.4,
                    child: Text('Adm.No',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                  Positioned( top: height/4,right: width/6,
                    child: Text('Roll No',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                  Positioned( top: height/3.6,left: width/5,
                    child: Text('XA',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                  Positioned( top: height/3.6,left: width/2.3,
                    child: Text('22M03',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                  Positioned( top: height/3.6,right: width/5,
                    child: Text('22',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                    },
                    child: IgnorePointer(
                      ignoring: true, // Make non-clickable
                      child: itemProfile('Personal Details', CupertinoIcons.person),
                    ),
                  ),


                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profileacademic(),));
                    },
                    child: IgnorePointer(
                      ignoring: true, // Make non-clickable
                      child: itemProfile('School Details', CupertinoIcons.book),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }

  Widget itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.indigoAccent.withOpacity(.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),

    );

  }
}

