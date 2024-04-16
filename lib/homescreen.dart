import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartcampusloginpage/events.dart';
import 'package:smartcampusloginpage/examhome.dart';
import 'package:smartcampusloginpage/fees.dart';
import 'package:smartcampusloginpage/parentdiary.dart';
import 'package:smartcampusloginpage/profilpage.dart';
import 'package:smartcampusloginpage/staffcontact.dart';
import 'package:smartcampusloginpage/timetable.dart';

import 'attendence.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen
      (splash: Image.asset('lib/assets/logo_icon.png') ,
        nextScreen: Homepage());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home page',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 50, right: 16, bottom: 2, top: 35),
              child: Align(
                alignment: Alignment.bottomLeft,
                child:Text(
                  'ABC Public School',
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button tap
              // You can navigate to a notification screen or show a notification panel here
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(

              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                 bottomRight: Radius.circular(150),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Anu Emmanuel',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'X A',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Admission No: 22M03',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'Roll Number: 12',
                        style: TextStyle(color: Colors.white70),
                      ),
                      // Add more subtitles as needed
                    ],
                  ),
                  trailing: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/assets/img.png'),
                  ),
                ),
              ],
            ),

          ),
      Container(
color: Colors.indigo,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90),
            ),
          ),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                },
                  child: itemHomePage('Profile', Icons.account_circle, Colors.deepOrange)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FeePaymentScreen(),));
                },
                  child: itemHomePage('Fees', Icons.monetization_on, Colors.blue)),
              InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ExamPage(),));
                 },
                  child: itemHomePage('Exam', Icons.assignment, Colors.cyan)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TimetablePage(),));
                },

                  child: itemHomePage('Time Table', Icons.book, Colors.blue)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParentHome(),));
                },

                  child: itemHomePage('Parent Diary', Icons.book, Colors.cyanAccent)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Attendance(),));
                },
                  child: itemHomePage('Attendance', Icons.check_circle, Colors.cyan)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Events(),));
                },
                  child: itemHomePage('Events', Icons.event, Colors.purple)),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(),));
                  },
                  child: itemHomePage('Contacts', Icons.contact_phone, Colors.green)),
            ],
          ),
        ),
      )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle bottom navigation item tap
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),

        ],
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedItemColor: Colors.indigo,


      ),
    );
  }

  Widget itemHomePage(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 3),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.subtitle1),
      ],
    ),
  );
}