import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/academicScreen.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/personalscreen.dart';
class profilepage extends StatelessWidget {
  const profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen
      (splash: Image.asset('lib/assets/Parents-pana.png'),
        nextScreen: profilepage());
  }
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

            },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
          onPressed: () {
            // Implement your action here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 70),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('lib/assets/img.png'),
            ),
            Text(
              "Anu Emmanuel",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 50),
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
                child: itemProfile('Academic Details', CupertinoIcons.book),
              ),
            ),
            const SizedBox(height: 50),

          ],
        ),
      ),
    );
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
          )
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

