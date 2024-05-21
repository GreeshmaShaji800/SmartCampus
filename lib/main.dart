import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/controller/eventprovider.dart';
import 'package:smartcampusloginpage/controller/exam_provider.dart';
import 'package:smartcampusloginpage/controller/provider.dart';
import 'package:smartcampusloginpage/loginscreen.dart';
import 'package:smartcampusloginpage/provider_class.dart';

import 'homescreen.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userprovide()),
        ChangeNotifierProvider(create: (context) => staffprovider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => ExamProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('lib/assets/logo_icon.png',fit:BoxFit.cover ,),
      backgroundColor: Colors.white,
      nextScreen: LoginScreen(),
      splashIconSize: 180,
      duration: 4000,

    );
  }
}




