import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';




class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height:height/4 ,
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
                Center(
                  child: Text('Exam ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                ),
                Positioned(
                  top: height/9.9,
                  left: width/12,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

                    },
                    child: Container(
                      height: height/17,
                      width: height/18,
                      decoration: BoxDecoration(border: Border.all(
                          color: Colors.grey
                      ),borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Row(

                    children: [
                      ExamCard(
                        title: "TimeTable",
                        image: "lib/assets/timetable.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamTimetablePage(),
                            ),
                          );
                        },
                      ),
                      ExamCard(
                        title: "Term Exam",
                        image: "lib/assets/exam.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InternalMark(),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(width:width/23 ,),
                  ExamCard(
                    title: "ReportCard",
                    image: "lib/assets/reportcard.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportCardPage(
                            examResults: [
                              ExamResult(
                                subject: 'Maths',
                                maxMark: 100,
                                passMark: 40,
                                marksObtained: 85,
                              ),
                              ExamResult(
                                subject: 'Physics',
                                maxMark: 100,
                                passMark: 40,
                                marksObtained: 75,
                              ),
                              ExamResult(
                                subject: 'Chemistry',
                                maxMark: 100,
                                passMark: 40,
                                marksObtained: 90,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ExamCard(
                    title: "Final Result",
                    image: "lib/assets/finalresult.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinalResultPage(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


class ExamCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const ExamCard({
    required this.title,
    required this.image,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160.0,
        height: 160.0,
        child: Card(
          color: Colors.white,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(image, width: 64.0),
                  SizedBox(height: 10.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExamTimetablePage extends StatelessWidget {
  final List<Map<String, String>> timetable = [
    {"Date": "12/2/2024", "Day": "Monday", "subject": "Math","P/T": "T" ,"time": "10:00 AM - 01.00PM"},
    {"Date": "14/2/2024", "Day": "Wednesday", "subject": "Biology","P/T": "T/P", "time": "10:00 AM - 01.00PM"},
    {"Date": "16/2/2024", "Day": "Friday", "subject": "IT","P/T": "P", "time": "02:00 AM - 05.00PM"},
    {"Date": "19/2/2024", "Day": "Monday", "subject": "Malayalam","P/T": "T" ,"time": "10:00 AM - 01.00PM"},
    {"Date": "20/2/2024", "Day": "Friday", "subject": "English", "P/T": "T","time": "02:00 AM - 05.00PM"},
    {"Date": "23/2/2024", "Day": "Monday", "subject": "Hindi", "P/T": "T","time": "10:00 AM - 01.00PM"},
    {"Date": "25/2/2024", "Day": "Wednesday", "subject": "Physics", "P/T": "T/P","time": "10:00 AM - 01.00PM"},
    {"Date": "27/2/2024", "Day": "Friday", "subject": "Chemistry", "P/T": "T/P","time": "02:00 AM - 5.00PM"},
  ];

  final ScrollController _scrollController = ScrollController();

  bool isScrolled = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
              child: Stack(
                children: [
                  SquareBox(
                      color1: Color(0xff6D4DBF),
                      color2: Color(0xff7E67D1),
                      height: height,
                      width: width),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 11.5,
                    right: width / 5.3,
                    child: Text(
                      'Exam Timetable ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: height / 5.5,
                  //   left: width / 7,
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: width / 100,
                  //       ),
                  //       Container(
                  //         height: width / 17,
                  //         width: width / 6,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.blue,
                  //         ),
                  //         margin: EdgeInsets.symmetric(horizontal: 5),
                  //         child: Center(
                  //           child: Text(
                  //             'Onam ',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: width / 15,
                  //       ),
                  //       IgnorePointer(
                  //         ignoring: true,
                  //         child: Container(
                  //           height: width / 17,
                  //           width: width / 6,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.grey,
                  //           ),
                  //           margin: EdgeInsets.symmetric(horizontal: 5),
                  //           child: Center(
                  //             child: Text(
                  //               'X Mas ',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: width / 15,
                  //       ),
                  //       IgnorePointer(
                  //         ignoring: true,
                  //         child: Container(
                  //           height: width / 17,
                  //           width: width / 6,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.grey,
                  //           ),
                  //           margin: EdgeInsets.symmetric(horizontal: 5),
                  //           child: Center(
                  //             child: Text(
                  //               'Annual ',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    top: height / 12.5,
                    left: width / 25,
                    child: Container(
                      height: height / 17,
                      width: height / 17,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExamPage()),
                          );
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Onam Examination september 2023-24',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'XA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Day')),
                  DataColumn(label: Text('Subject')),
                  DataColumn(label: Text("P/T")),
                  DataColumn(label: Text('Time')),
                ],
                rows: timetable
                    .map(
                      (exam) => DataRow(cells: [
                    DataCell(Text(exam["Date"]!)),
                    DataCell(Text(exam["Day"]!)),
                    DataCell(Text(exam["subject"]!)),
                    DataCell(Text(exam["P/T"]!)),
                    DataCell(Text(exam["time"]!)),
                  ]),
                )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!isScrolled) {
                        _scrollController.animateTo(
                          _scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                      isScrolled = !isScrolled;
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        isScrolled ? Colors.white : Color(0xff6D4DBF),
                      ),
                    ),
                    child: Text(
                      isScrolled ? 'Scroll to Normal' : 'Scroll to Right',
                      style: TextStyle(
                        color: isScrolled ? Colors.white : Colors.white,
                      ),
                    ),

                  ),
                  SizedBox(height: 10),
                  Table(
                    border: TableBorder.all(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}


class InternalMark extends StatefulWidget {
  @override
  _InternalMarkState createState() => _InternalMarkState();
}

class _InternalMarkState extends State<InternalMark> {
  int _selectedClass = 1;
  String _selectedSchool = 'ABC public school';
  String _selectedTerm = '2nd Term'; // Default selection

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container( // Container for app bar
            height: height/4,
            width: double.infinity,
            color: Color(0xff6D4DBF),
            child: Stack(
              children: [
                SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                Align(alignment: Alignment.bottomCenter
                  ,child: Container(
                    height: height/35,
                    width: double.infinity,
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
                  ),
                ),
                Positioned(
                  top: height/11.5,right: width/5,
                  child: Text('Class Test Result',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                    ,fontSize: 25,),),
                ),

                // Positioned(
                //   top: height / 5.5,
                //   left: width / 7,
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: width / 100,
                //       ),
                //       Container(
                //         height: width / 17,
                //         width: width / 6,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20),
                //           color: Colors.blue,
                //         ),
                //         margin: EdgeInsets.symmetric(horizontal: 5),
                //         child: Center(
                //           child: Text(
                //             'Onam ',
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: width / 15,
                //       ),
                //       IgnorePointer(
                //         ignoring: true,
                //         child: Container(
                //           height: width / 17,
                //           width: width / 6,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Colors.grey,
                //           ),
                //           margin: EdgeInsets.symmetric(horizontal: 5),
                //           child: Center(
                //             child: Text(
                //               'X Mas ',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: width / 15,
                //       ),
                //       IgnorePointer(
                //         ignoring: true,
                //         child: Container(
                //           height: width / 17,
                //           width: width / 6,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(20),
                //             color: Colors.grey,
                //           ),
                //           margin: EdgeInsets.symmetric(horizontal: 5),
                //           child: Center(
                //             child: Text(
                //               'Annual ',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Positioned(
                  top: height/13,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ExamPage(),));
                        },

                        child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              'Onam Exam Result -  XA class',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: height/45,),
          Center(
            child: Text(
              'Academic year = 2023-2024',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 25),
          Scrollbar(
            thumbVisibility: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FractionColumnWidth(0.25),
                      1: FractionColumnWidth(0.15),
                      2: FractionColumnWidth(0.15),
                      3: FractionColumnWidth(0.15),

                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                              child: Text(
                                'Subject',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                'Total Mark',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          TableCell(
                            child: Center(
                              child: Text(
                                'Score',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text(
                                'Grade',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                        ],
                      ),
                      buildRow(['Maths', '50',  '30', 'B', ]),
                      buildRow(['Physics', '50',  '35', 'B', ]),
                      buildRow(['Chemistry', '50',  '39', 'B+', ]),
                      buildRow(['Biology', '50',  '36', 'B+', ]),
                      buildRow(['Malayalam', '50',  '42', 'A', ]),
                      buildRow(['IT', '50',  '39', 'B+', ]),
                      buildRow(['Hindi', '50',  '38', 'B+', ]),
                      buildRow(['History', '50',  '38', 'B+', ]),
                      buildRow(['Geography', '50',  '42', 'A', ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 15,
        );
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              cell,
              style: style,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ReportCardPage extends StatelessWidget {
  final List<ExamResult> examResults;

  const ReportCardPage({required this.examResults, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
              child: Stack(
                children: [
                  SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.print),
                            onPressed: () {
                              // Handle printing action here
                              printReportCard();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 10,
                    right: width / 4,
                    child: Text(
                      'Report card ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Positioned(
                    top: height / 11,
                    left: width / 18,
                    child: Container(
                      height: height / 17,
                      width: height / 17,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ExamPage(),));
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Center(
              child: Text(
                'ABC Public School',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height / 106),
            Center(
              child: Text(
                'Abc road Vyttila',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height / 150),
            Center(
              child: Text(
                'Ernakulam,Vyttila',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 2),
            Center(
              child: Text(
                'abcpublic@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 1),
            Center(
              child: Text(
                'Onam Exam Result',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 1),
            Center(
              child: Text(
                'Class:XA',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width/25,),
                Text(
                  'Student Name : Anu Emmanuel',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width/25,),
                Text(
                  'Roll No : 22',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FractionColumnWidth(0.25),
                        1: FractionColumnWidth(0.15),
                        2: FractionColumnWidth(0.15),
                        3: FractionColumnWidth(0.15),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Subject',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Score',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Grade',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildRow(['Maths', '50',  '30', 'B', ]),
                        buildRow(['Physics', '50',  '35', 'B', ]),
                        buildRow(['Chemistry', '50',  '39', 'B+', ]),
                        buildRow(['Biology', '50',  '36', 'B+', ]),
                        buildRow(['Malayalam', '50',  '42', 'A', ]),
                        buildRow(['IT', '50',  '39', 'B+', ]),
                        buildRow(['Hindi', '50',  '38', 'B+', ]),
                        buildRow(['History', '50',  '38', 'B+', ]),
                        buildRow(['Geography', '50',  '42', 'A', ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: {
                        0: FractionColumnWidth(0.25),
                        1: FractionColumnWidth(0.15),
                        2: FractionColumnWidth(0.15),
                        3: FractionColumnWidth(0.15),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Subject',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                          ],
                        ),
                        buildRow(['Total', '450', ]),
                        buildRow(['Score', '377', ]),
                        buildRow(['Percentage', '75%',]),
                        buildRow(['Grade', 'B+',]),
                        // Add more rows here if needed
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text('A+ Excellent',style: TextStyle(fontWeight: FontWeight.bold)),

                        Text('A Outstanding',style: TextStyle(fontWeight: FontWeight.bold)),

                        Text('B VeryGood',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],),


                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text('C Good',style: TextStyle(fontWeight: FontWeight.bold)),

                        Text('D Satisfactory',style: TextStyle(fontWeight: FontWeight.bold)),

                        Text('E Fail',style: TextStyle(fontWeight: FontWeight.bold)),
                      ],),


                  ),




                ],
              ),
            ),
           SizedBox(height: height/15,)
           // Add more empty space here
          ],
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        final style = TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: 15,
        );
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              cell,
              style: style,
            ),
          ),
        );
      }).toList(),
    );
  }

  void printReportCard() {
    // Implement your printing logic here
    print("Printing report card...");
  }
}

class ExamResult {
  final String subject;
  final int maxMark;
  final int passMark;
  final int marksObtained;

  ExamResult({
    required this.subject,
    required this.maxMark,
    required this.passMark,
    required this.marksObtained,
  });
}





class FinalResultPage extends StatelessWidget {
  const FinalResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height/4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
             child: Stack(
               children: [
                 SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                 Align(alignment: Alignment.bottomCenter
                   ,child: Container(
                     height: height/35,
                     width: double.infinity,
                     decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                       topRight: Radius.circular(100),
                     )),
                   ),
                 ),
                 Positioned(
                   top: height/10,right: width/3,
                   child: Text('Final Result',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                     ,fontSize: 25,),),
                 ),

                 Positioned(
                   top: height/11.5,
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
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ExamPage(),));
                         },

                         child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                   ),
                 ),
               ],
             ),
            ),

            // Centered texts


            // First table
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FractionColumnWidth(0.20),
                1: FractionColumnWidth(0.20),
                2: FractionColumnWidth(0.20),
                3: FractionColumnWidth(0.20),
                4: FractionColumnWidth(0.20),
                5: FractionColumnWidth(0.20),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('Subject', style: TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(child: Center(child: Text('1st Term', style: TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(child: Center(child: Text('2nd Term', style: TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(child: Center(child: Text('Final', style: TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(child: Center(child: Text(''
                        'Score', style: TextStyle(fontWeight: FontWeight.bold)))),
                    TableCell(child: Center(child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)))),
                  ],
                ),
                // Add your rows here
                buildTableRow(['Maths', '20', '40', '20', '80', '100']),
                buildTableRow(['Physics', '30', '20', '30', '80', '100']),
                buildTableRow(['Chemistry', '20', '40', '25', '85', '100']),
                buildTableRow(['Biology', '25', '25', '30', '80', '100']),
                buildTableRow(['Malayalam', '25', '35', '30', '80', '100']),
                buildTableRow(['English', '25', '26', '40', '91', '100']),
                buildTableRow(['History', '25', '25', '40', '90', '100']),
                buildTableRow(['Geography', '25', '23', '31', '95', '100']),
                buildTableRow(['IT', '25', '35', '30', '75', '90']),
                // Add more rows as needed
              ],
            ),

            SizedBox(height: 20),

            // Second table

          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(List<String> data) {
    return TableRow(
      children: data.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cell,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
        );
      }).toList(),
    );
  }
}
