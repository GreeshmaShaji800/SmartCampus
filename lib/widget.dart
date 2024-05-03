import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({super.key,required this.event,required this.date,required this.color1,required this.color2});
  final String event;
  final String date;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: height / 10,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color1,color2.withOpacity(.7)]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        Padding(
          padding: const EdgeInsets.only(left: 30.0,top: 6),
          child: Text(event,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(date,style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        )
      ],),
    );
  }
}