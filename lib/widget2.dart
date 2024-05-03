import 'package:flutter/material.dart';

class SliderPages extends StatelessWidget {

  const SliderPages({super.key,required this.subject,required this.topic,required this.duedate,required this.color1,required this.color2});
  final String subject;
  final String topic;
  final String duedate;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Container(
      height: height/5,width: double.infinity,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [ color2,color1.withOpacity(.7)],),borderRadius: BorderRadius.circular(20)

        //  borderRadius: BorderRadius.circular(8.0),



      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 20),
            child: Text(subject,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 20),
                child: Text('Topic:',style: TextStyle(color: Colors.white,fontSize: 18,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 2),
                child: Text(topic,style: TextStyle(color: Colors.white,fontSize: 16,),),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20),
                child: Text('DueDate :',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0,right: 20),
                child: Text(duedate,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}