import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareBox2 extends StatelessWidget {
  SquareBox2({super.key,required this.color1,required this.color2,required this.size});
  final Color color1;
  final Color color2;
  final double size;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color1,borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [

          Positioned(
            left: size/2,
            top: size/4,
            child: Container(
              height: size/2,
              width: size/4,
              color: color2.withOpacity(0.3),
            ),
          ),


          Positioned(left: size/3,
            child: Container(
              height: size/3,
              width: size/2,
              //color: Color(0xff7E67D1),
              decoration: BoxDecoration(gradient: LinearGradient(colors: [color2.withOpacity(0.3), color1],),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Positioned(
            left: size/2.3,
            top: size/2,
            child: Container(
              height: size/3,
              width: size/2,
              color: color2.withOpacity(0.3),
            ),
          ),


          Positioned(
            left: size/4.5,
            top: size/6,
            child: Container(
              height: size/1.5,
              width: size/3,
              color: color2.withOpacity(0.3),
            ),
          ),Positioned(
            left: size/13.2,
            top: size/1.5,
            child: Container(
              height: size/3,
              width: size/1.5,
              color: color2.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}