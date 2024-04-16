import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thickness: MaterialStateProperty.all(10.0),
          radius: Radius.circular(5.0),
          thumbColor: MaterialStateProperty.all(Colors.indigo.shade800),
        ),
      ),
      home: ExamPage(),
    ),
  );
}

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Exam Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: IconButton(
          icon: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
              child: Icon(Icons.arrow_back, color: Colors.white)),
          onPressed: () {
            // Add your menu onPressed functionality here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Notification message'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 70.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bsc Electronics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "ExamPage",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    ExamCard(
                      title: "TimeTable",
                      image: "assets/timetable.png",
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
                      title: "Internal Exam",
                      image: "assets/exam.png",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InternalMark(),
                          ),
                        );
                      },
                    ),
                    ExamCard(
                      title: "ReportCard",
                      image: "assets/reportcard.png",
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
                      image: "assets/exam.png",
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
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.indigo,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exam Timetable",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Second term regular examination 2023-24',
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
                      '10 A',
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
                  DataColumn(label:Text("P/T")),
                  DataColumn(label: Text('Time')),
                ],
                rows: timetable.map((exam) => DataRow(cells: [
                  DataCell(Text(exam["Date"]!)),
                  DataCell(Text(exam["Day"]!)),
                  DataCell(Text(exam["subject"]!)),
                  DataCell(Text(exam["P/T"]!)),
                  DataCell(Text(exam["time"]!)),
                ])).toList(),
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
                        isScrolled ? Colors.white : Colors.indigo,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.indigo,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Internal Mark', style: TextStyle(color: Colors.white)),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('8A class'),
              ),
              PopupMenuItem(
                child: Text('9A class'),
              ),
              PopupMenuItem(
                child: Text('3rd Term'),
              ),
            ],
            onSelected: (String value) {
              setState(() {
                _selectedTerm = value;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            SizedBox(height: 15),
            Center(
              child: Text(
                'Second Term Mark List - $_selectedClass 8A class',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                _selectedSchool,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Academic year = 2023-2024',
                style: TextStyle(
                  fontSize: 14,
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
                        4: FractionColumnWidth(0.15),
                        5: FractionColumnWidth(0.15),
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
                                  '1st',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  '2nd',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  '3rd',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Maximum',
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
                        buildRow(['Maths', '10', '10', '10', '30', '50']),
                        buildRow(['Physics', '8', '9', '10', '30', '47']),
                        buildRow(['Chemistry', '9', '8', '9', '30', '48']),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
}

class ReportCardPage extends StatelessWidget {
  final List<ExamResult> examResults;

  const ReportCardPage({required this.examResults, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Report Card',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.print,color: Colors.white,),
            onPressed: () {
              // Add functionality to print the report card here
              print('Printing report card...');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              Center(
                child: Text(
                  'Report Card',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'NSS College Rajakumari',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Rajakumari road Rajakumari',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Idukki,Rajakumari',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Nsscollege@gmail.com',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Annual Exam Result',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Class: Bsc Electronics',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Student Name : Anu',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Roll No : 12',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27),
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
                          4: FractionColumnWidth(0.15),
                          5: FractionColumnWidth(0.15),
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
                                    'credit',
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
                                    'Internal',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Maximum',
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
                          buildRow(['Maths', '10', '10', '10', '30', '50']),
                          buildRow(['Physics', '8', '9', '10', '30', '47']),
                          buildRow(['Chemistry', '9', '8', '9', '30', '48']),
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
                          4: FractionColumnWidth(0.15),
                          5: FractionColumnWidth(0.15),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Scolastic Area',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    '1st',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    '2nd',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    '3rd',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Maximum',
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
                          buildRow(['English', '8', '9', '8', '25', '47']),
                          buildRow(['History', '8', '9', '8', '25', '47']),
                          buildRow(['Geography', '7', '8', '9', '25', '48']),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Final Result Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Final Result ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Centered texts
              Center(child: Text('St George School', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              Center(child: Text('Minnu Maria', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              Center(child: Text('Class: 10A', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
              SizedBox(height: 20),

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
                      TableCell(child: Center(child: Text('Score', style: TextStyle(fontWeight: FontWeight.bold)))),
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
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FractionColumnWidth(0.5),
                  1: FractionColumnWidth(0.5),
                  2: FractionColumnWidth(0.5),
                },
                children: [
                  buildTableRow(['Total','1000',]),
                  buildTableRow(['Score', '771']),
                  buildTableRow(['Percentage', '90%']),
                  buildTableRow(['Grade', ' B']),
                ],
              ),
            ],
          ),
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