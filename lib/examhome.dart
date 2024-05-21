import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:http/http.dart' as http;
import 'Model/exam_model.dart';
import 'controller/exam_provider.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);
  @override
  State<ExamPage> createState() => _ExamPageState();
}
class _ExamPageState extends State<ExamPage> {
  @override

  ExamModel? examsList;
  Future<void> getExamData() async {
    final userProvider=Provider.of<userprovide>(context,listen: false);
    final examProvider=Provider.of<ExamProvider>(context,listen: false);
    var Url = 'https://sfsetr.smartcampus.co/api/services/app/MobileAPI/GetExamMarksSummaryOfStudentForMobileAPI';
    var uri = Uri.parse(Url);
    var response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userProvider.Token}'
        },
        body: jsonEncode(
            <String, dynamic>{
              "InstitutionId": "1",
              "IsCurrentTerm": "true",
              "BatchId": userProvider.batchid,
              "StudentId": userProvider.studentId,
              "AcademicStartDate":"2024/03/01",
              "AcademicEndDate":"2025/03/31"
            }));
    if (response.statusCode == 200) {
      var examList = jsonDecode(response.body);
      examProvider.examList=examModelFromJson(response.body);
      examProvider.Exams=examList;
      print(examProvider.examList!.result.items[0].examName);
    }
  }

  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height / 4,
            width: double.infinity,
            color: Color(0xff6D4DBF),
            child: Stack(
              children: [
                SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xf7E67D1), height: height, width: width),
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
                  top: height/11,right: width/2.3,
                  child: Text('Exam',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                    ,fontSize: 25,),),
                ),
                Positioned(
                  top: height/12,
                  left: width/18,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    child: Container(
                      height: height/17,
                      width: height/17,
                      decoration: BoxDecoration(border: Border.all(
                          color: Colors.grey
                      ),borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    ),
                  ),
                ),

              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 100),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExamTimetablePage(),));
                  },
                  child: IgnorePointer(
                    ignoring: true, // Make non-clickable
                    child: itemProfile('Exam Timetable', CupertinoIcons.book),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () async{
                    await getExamData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>ExamListPage() ,));
                  },
                  child: IgnorePointer(
                    ignoring: true, // Make non-clickable
                    child: itemProfile('Exam Result', CupertinoIcons.book),
                  ),
                ),
                const SizedBox(height: 40),

              ],
            ),
          ),
        ],
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
          ),
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
class ExamListPage extends StatelessWidget {
  const ExamListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    final ExamList=Provider.of<ExamProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height / 4,
            width: double.infinity,
            color: Color(0xff6D4DBF),
            child: Stack(
              children: [
                SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xf7E67D1), height: height, width: width),
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
                  top: height/11,right: width/2.3,
                  child: Text('ExamResult',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                    ,fontSize: 25,),),
                ),
                Positioned(
                  top: height/12,
                  left: width/18,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height/17,
                      width: height/17,
                      decoration: BoxDecoration(border: Border.all(
                          color: Colors.grey
                      ),borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    ),
                  ),
                ),

              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  height: height/2,
                  child: ListView.builder(itemCount:ExamList.examList!.result.items.length,itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InternalMark(id: ExamList.examList!.result.items[index].examId,),));
                          },
                          child: IgnorePointer(
                            ignoring: true, // Make non-clickable
                            child: itemProfile(ExamList.examList!.result.items[index].examName, CupertinoIcons.book),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    );

                  },),
                ),


              ],
            ),
          ),
        ],
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
          ),
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
              height: height / 4.5,
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
                    right: width / 4.5,
                    child: Text(
                      'Exam Timetable ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),

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
                      'XB',
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
            SizedBox(height: 02),
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
  InternalMark({super.key,required this.id});
  final id;





  @override
  _InternalMarkState createState() => _InternalMarkState();
}

class _InternalMarkState extends State<InternalMark>  {


  int _selectedClass = 1;
  String _selectedSchool = 'ABC public school';
  String _selectedTerm = '2nd Term'; // Default selection



  @override
  Widget build(BuildContext context) {
    final ExamList=Provider.of<ExamProvider>(context);

    List<Map<String,dynamic>>examsSubjectMarks=[
      for(int i=0;i<ExamList.examList!.result.items.length;i++)
        if(widget.id==ExamList.examList!.result.items[i].examId)
          for(int j=0;j<ExamList.examList!.result.items[i].markList.length;j++)
            {"subjectId":ExamList.examList!.result.items[i].markList[j].subjectId,
              "subjectName":ExamList.examList!.result.items[i].markList[j].subjectName,
              "passMark":ExamList.examList!.result.items[i].markList[j].passMark,
              "maximumMark":ExamList.examList!.result.items[i].markList[j].maximumMark,
              "result":ExamList.examList!.result.items[i].markList[j].result,
              "mark":ExamList.examList!.result.items[i].markList[j].mark,
              "grade":ExamList.examList!.result.items[i].markList[j].grade,
            }
    ];
    var Examname;
    for(int i=0;i<ExamList.examList!.result.items.length;i++)
      if(widget.id==ExamList.examList!.result.items[i].examId)
        {
          Examname=ExamList.examList!.result.items[i].examName;
        }



    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container(  // Container for app bar
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
                  top: height/11,right: width/3.3,
                  child: Text('Exam Result',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                    ,fontSize: 25,),),
                ),

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
                          Navigator.pop(context);
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
              Examname ,
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
                      for(int i=0;i<examsSubjectMarks.length;i++)
                        buildRow([examsSubjectMarks[i]['subjectName'], examsSubjectMarks[i]['maximumMark'].toString(),  examsSubjectMarks[i]['mark'].toString(), (examsSubjectMarks[i]['grade']==1)?'A' : (examsSubjectMarks[i]['grade']==2)?'B':(examsSubjectMarks[i]['grade']==3)?'C':(examsSubjectMarks[i]['grade']==4)?'D':'E', ]),

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
//
// class ExamResult {
//   final String subject;
//   final int maxMark;
//   final int passMark;
//   final int marksObtained;
//
//   ExamResult({
//     required this.subject,
//     required this.maxMark,
//     required this.passMark,
//     required this.marksObtained,
//   });
// }





// class FinalResultPage extends StatelessWidget {
//   const FinalResultPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var height=MediaQuery.of(context).size.height;
//     var width=MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: height/4,
//               width: double.infinity,
//               color: Color(0xff6D4DBF),
//               child: Stack(
//                 children: [
//                   SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
//                   Align(alignment: Alignment.bottomCenter
//                     ,child: Container(
//                       height: height/35,
//                       width: double.infinity,
//                       decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
//                         topRight: Radius.circular(100),
//                       )),
//                     ),
//                   ),
//                   Positioned(
//                     top: height/10,right: width/3,
//                     child: Text('Final Result',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
//                       ,fontSize: 25,),),
//                   ),
//                   Positioned(
//                     top: height/11.5,
//                     left: width/18,
//                     child: Container(
//                       height: height/17,
//                       width: height/17,
//                       decoration: BoxDecoration(border: Border.all(
//
//                           color: Colors.grey
//                       ),borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: InkWell(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => ExamPage(),));
//                           },
//
//                           child: Icon(Icons.arrow_back_ios,color: Colors.white,)
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Centered texts
//
//
//             // First table
//             Table(
//               border: TableBorder.all(),
//               columnWidths: {
//                 0: FractionColumnWidth(0.20),
//                 1: FractionColumnWidth(0.20),
//                 2: FractionColumnWidth(0.20),
//                 3: FractionColumnWidth(0.20),
//                 4: FractionColumnWidth(0.20),
//                 5: FractionColumnWidth(0.20),
//               },
//               children: [
//                 TableRow(
//                   children: [
//                     TableCell(child: Center(child: Text('Subject', style: TextStyle(fontWeight: FontWeight.bold)))),
//                     TableCell(child: Center(child: Text('1st Term', style: TextStyle(fontWeight: FontWeight.bold)))),
//                     TableCell(child: Center(child: Text('2nd Term', style: TextStyle(fontWeight: FontWeight.bold)))),
//                     TableCell(child: Center(child: Text('Final', style: TextStyle(fontWeight: FontWeight.bold)))),
//                     TableCell(child: Center(child: Text(''
//                         'Score', style: TextStyle(fontWeight: FontWeight.bold)))),
//                     TableCell(child: Center(child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)))),
//                   ],
//                 ),
//                 // Add your rows here
//                 buildTableRow(['Maths', '20', '40', '20', '80', '100']),
//                 buildTableRow(['Physics', '30', '20', '30', '80', '100']),
//                 buildTableRow(['Chemistry', '20', '40', '25', '85', '100']),
//                 buildTableRow(['Biology', '25', '25', '30', '80', '100']),
//                 buildTableRow(['Malayalam', '25', '35', '30', '80', '100']),
//                 buildTableRow(['English', '25', '26', '40', '91', '100']),
//                 buildTableRow(['History', '25', '25', '40', '90', '100']),
//                 buildTableRow(['Geography', '25', '23', '31', '95', '100']),
//                 buildTableRow(['IT', '25', '35', '30', '75', '90']),
//                 // Add more rows as needed
//               ],
//             ),
//
//             SizedBox(height: 20),
//
//             // Second table
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   TableRow buildTableRow(List<String> data) {
//     return TableRow(
//         children: data.map((cell) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 cell,
//                 style: TextStyle(fontWeight: FontWeight.normal),
//               ),
//             ),
//           );
//         }).toList(),
//        );
//    }
// }
