import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  SquareBox({super.key,required this.color1,required this.color2,required this.height,required this.width});
  final Color color1;
  final Color color2;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height/4,
      width: double.infinity,
      color: color1,
      child: Stack(
        children: [

          Positioned(
            left: width/3.6,
            top: height/16,
            child: Container(
              height: height/10,
              width: height/20,
              color: color2.withOpacity(0.3),
            ),
          ),


          Positioned(left: height/5.71,
            child: Container(
              height: height/8,
              width: height/10,
              //color: Color(0xff7E67D1),
              decoration: BoxDecoration(gradient: LinearGradient(colors: [color2.withOpacity(0.3), color1],),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Positioned(
            left: height/3.2,
            top: height/10,
            child: Container(
              height: height/10,
              width: height/7,
              color: color2.withOpacity(0.5),
            ),
          ),


          Positioned(
            left: height/4,
            top: height/16,
            child: Container(
              height: height/20,
              width: height/10,
              color: color2.withOpacity(0.5),
            ),
          ),Positioned(
            left: height/13.2,
            top: height/8,
            child: Container(
              height: height/20,
              width: height/10,
              color: color2.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}