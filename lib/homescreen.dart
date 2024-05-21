import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/assigment.dart';
import 'package:smartcampusloginpage/controller/provider.dart';
import 'package:smartcampusloginpage/events.dart';
import 'package:smartcampusloginpage/leaveapplication.dart';
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:smartcampusloginpage/staffcontact.dart';
import 'package:smartcampusloginpage/timetable.dart';
import 'package:smartcampusloginpage/widget.dart';
import 'package:smartcampusloginpage/widget2.dart';
import 'package:smartcampusloginpage/widget5.dart';

import 'controller/eventprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<userprovide>(builder: (context, basicdetails, child) => Container(
            height: height / 4,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: [
                SquareBox(
                    color1: Color(0xff6D4DBF),
                    color2: Color(0xff7E67D1),
                    height: height,
                    width: width),
                // SquareBox(color1: Colors.blue, color2: Colors.blue[200]!, height: height, width: width),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height / 35,
                    width: double.infinity,
                    //   color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100))),
                  ),
                ),
                Positioned(
                  top: height / 12,
                  left: width / 15,
                  child: Container(
                    height: height / 12,
                    width: height / 12,
                    //   color: Colors.white,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),image:
                    DecorationImage(image: AssetImage('lib/assets/img.png'))),
                  ),
                ),
                Positioned(
                    left: height / 8,
                    top: height / 11,
                    child: Text(
                      basicdetails.Name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: height / 8.5,
                    left: height / 8,
                    child: Text(
                      'Batch      :     ${basicdetails.batchname}',
                      style: TextStyle(color: Colors.white),
                    )),
                Positioned(
                    top: height / 7.3,
                    left: height / 8,
                    child: Text(
                      'Adm No  :     ${basicdetails.Admission}',
                      style: TextStyle(color: Colors.white),
                    )),

                Positioned(
                    top: height / 9,
                    left: height / 2.6,
                    child: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 28,
                    ))
              ],
            ),
          ),),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Pending Assignments',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: width / 3.5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Assignmentpage(),));
                  },


                  child: Text(
                    'See all',
                    style: TextStyle(color: Color(0xff6D4DBF)),
                  ),
                ),
              ),
            ],
          ),
          Consumer<userprovide>(builder: (context, assignmentProvider, child) => Container(
            height: height / 5.3,
            width: double.infinity,
            //color: Colors.grey,

            child:(assignmentProvider.assignment1==null) ?CarouselSlider(
              items: [
                SliderPages(
                    subject: "SubjectName",
                    topic:  "Topic",
                    duedate: "dd/mm/yyyy",
                    color1:  Color(0xff9F7FEE),
                    color2:  Color(0xff8167D5)
                ),

              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 1.0,
              ),
            ): CarouselSlider(
              items: [
                //1st Image of Slider
                for (var i = 0; i <assignmentProvider.assignmentdata2.length; i++)
                  if ((assignmentProvider.assignmentdata2[i]['submissionDate'])
                      .isAfter(DateTime.now()))
                    SliderPages(
                      subject: assignmentProvider.assignmentdata2[i]['subjectName'],
                      topic:  assignmentProvider.assignmentdata2[i]['title'],
                      duedate:  DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(assignmentProvider.assignmentdata2[i]['submissionDate'].toString())),
                      color1: (i % 3 == 0) ? Color(0xff9F7FEE) : (i % 3 == 1) ? Color(0xffFEA0B2) :
                      (i % 3 == 2) ?Color(0xffA2DBF9) : Colors.white,
                      color2:(i % 3 == 0) ?  Color(0xff8167D5): (i % 3 == 1) ?  Color(0xffFB7E9C) :
                      (i % 3 == 2) ?Color(0xff92D3F1) : Colors.white,
                    ),
                // SliderPages(
                //   subject: 'Maths',
                //   topic: 'Trigonometry',
                //   duedate: '06-06-2024',
                //   color1: Color(0xffFEA0B2),
                //   color2: Color(0xffFB7E9C),
                // ),
                // SliderPages(
                //   subject: 'Science',
                //   topic: 'Thermodynamics',
                //   duedate: '06-06-2024',
                //   color1: Color(0xffA2DBF9),
                //   color2: Color(0xff92D3F1),
                // ),

                //2nd Image of Slider
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                viewportFraction: 1.0,
              ),
            ),
          ),),
          Container(
            height: height / 4.6,
            width: double.infinity,
            //   color: Colors.orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2),
                  child: Text(
                    "Parent Diary",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: height / 80,
                ),
                Container(
                  height: height / 5.8, width: double.infinity,
                  // color: Colors.yellow,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width / 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Assignmentpage(),));
                        },
                        child: Container(
                          height: height / 5.8,
                          width: height / 5.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              SquareBox2(
                                  color1: Color(0xff8167D5),
                                  color2: Color(0xff9F7FEE),
                                  size: height / 5.8),
                              Positioned(
                                  top: height / 50,
                                  left: height / 50,
                                  child: Container(
                                    height: height / 26,
                                    width: height / 26,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.assessment,
                                      color: Color(0xff6D4DBF),
                                    ),
                                  )),
                              Positioned(
                                  top: height / 14,
                                  left: width / 22,
                                  child: Text(
                                    'Assignment',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                              Positioned(
                                top: height / 9,
                                left: width / 14,
                                child: Row(
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Container(
                                        height: height / 25,
                                        width: width / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.2),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                              'Now',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveApplicationForm(),));

                        },
                        child: Container(
                          height: height / 5.8,
                          width: height / 5.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              SquareBox2(
                                  color1: Color(0xffFB7E9C),
                                  color2: Color(0xffFEA0B2),
                                  size: height / 5.8),
                              Positioned(
                                  top: height / 50,
                                  left: height / 50,
                                  child: Container(
                                    height: height / 26,
                                    width: height / 26,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.queue_play_next,
                                      color: Color(0xffFB7E9C),
                                    ),
                                  )),
                              Positioned(
                                  top: height / 14,
                                  left: width / 22,
                                  child: Text(
                                    'Leave',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                              Positioned(
                                top: height / 9,
                                left: width / 14,
                                child: Row(
                                  children: [
                                    Text(
                                      'Apply',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Container(
                                        height: height / 25,
                                        width: width / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.2),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                              'Now',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      InkWell(
                        onTap: () async{
                          final staffProvider=Provider.of<staffprovider>(context,listen: false);
                          await staffProvider.getStaffData();

                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(),));

                        },
                        child: Container(
                          height: height / 5.8,
                          width: height / 5.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              SquareBox2(
                                  color1: Color(0xff92D3F1),
                                  color2: Color(0xffA2DBF9),
                                  size: height / 5.8),
                              Positioned(
                                  top: height / 50,
                                  left: height / 50,
                                  child: Container(
                                    height: height / 26,
                                    width: height / 26,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.perm_contact_cal_outlined,
                                      color: Color(0xff92D3F1),
                                    ),
                                  )),
                              Positioned(
                                  top: height / 14,
                                  left: width / 22,
                                  child: Text(
                                    'Staff Contacts',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                              Positioned(
                                top: height / 9,
                                left: width / 14,
                                child: Row(
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Container(
                                        height: height / 25,
                                        width: width / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.2),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                              'Now',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 40,
                      ),
                      InkWell(
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimetablePage(),));
                        },
                        child: Container(
                          height: height / 5.8,
                          width: height / 5.8,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              SquareBox2(
                                  color1: Color(0xff8167D5),
                                  color2: Color(0xff9F7FEE),
                                  size: height / 5.8),
                              Positioned(
                                  top: height / 50,
                                  left: height / 50,
                                  child: Container(
                                    height: height / 26,
                                    width: height / 26,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.view_timeline_outlined,
                                      color: Color(0xff6D4DBF),
                                    ),
                                  )),
                              Positioned(
                                  top: height / 14,
                                  left: width / 22,
                                  child: Text(
                                    'TimeTable',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                              Positioned(
                                top: height / 9,
                                left: width / 14,
                                child: Row(
                                  children: [
                                    Text(
                                      'View',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Container(
                                        height: height / 25,
                                        width: width / 6,
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(.2),
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                              'Now',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height / 10, width: double.infinity,
            //  color: Colors.purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    'Attendance',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Color(0xff9F7FEE),
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Mon')),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Color(0xffFEA0B2),
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Tue')),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Color(0xff9F7FEE),
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Wed')),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Color(0xff9F7FEE),
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Thu')),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Fri')),
                      ),
                      Container(
                        height: height / 30,
                        width: width / 7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text('Sat')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height / 7,
            width: double.infinity,
            //    color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 15),
                      child: Text(
                        'Upcoming Events',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: width/2,),

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Events(),));


                      },

                        child: Icon(Icons.arrow_forward_ios,size: 17,))
                  ],
                ),
                Container(
                  height: height / 10,
                  //   color: Colors.yellow,
                  child: Consumer<EventProvider>(builder: (context, EventProvider, child) => Container(
                      height: height / 10,
                      //   color: Colors.yellow,
                      child: CarouselSlider(
                        items: [
                          for(var i=0;i<EventProvider.data!.result.items.length;i++)
                            if ((EventProvider.data!.result.items[i].start).isAfter(DateTime.now()))
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Events(),));
                                },

                                   child: EventContainer(event: EventProvider.data!.result.items[i].title, date: DateFormat('dd/MM/yyyy').format(DateTime.parse(EventProvider.data!.result.items[i].start.toString())), color1: (i%3==0) ? Color(0xff8167D5) :(i%3==1) ?Color(0xffFB7E9C):(i%3==2)?Color(0xff92D3F1):Colors.white, color2:(i%3==0) ? Color(0xff8167D5) :(i%3==1) ?Color(0xffFB7E9C):(i%3==2)?Color(0xff92D3F1):Colors.white)),


                          // EventContainer(event: 'Science Exhibition', date: '10/06/2024', color1: Color(0xffFB7E9C), color2: Color(0xffFB7E9C)),
                          // EventContainer(event: 'Arts Day', date: '10/06/2024', color1:  Color(0xff  92D3F1), color2:  Color(0xff92D3F1))
                        ],

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 180.0,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 1000),
                          viewportFraction: 1.0,
                        ),
                      ),
                      ),)
                  ,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}