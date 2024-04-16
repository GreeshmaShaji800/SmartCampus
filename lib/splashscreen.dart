import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/loginscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/logo_icon.png'),
      backgroundColor: Colors.white,
      nextScreen: LoginScreen(),
      splashIconSize: 200,
      duration: 4000,

    );
  }
}