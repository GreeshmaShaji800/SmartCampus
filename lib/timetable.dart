import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimetablePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimetablePage extends StatefulWidget {
  @override
  _TimetablePageState createState() => _TimetablePageState();
}



class _TimetablePageState extends State<TimetablePage> {
  DateTime? fromDate;
  DateTime? toDate;
  List<DateTime> dateList = [];

  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final List<String> periods = ["1st Period", "2nd Period", "3rd Period", "4th Period", "5th Period", "6th period", "7th period", "8th period"];
  final List<String> subjects = ["Math", "Science", "English", "History", "Art", "Music", "biology", "history", "Art", "biology", "chemistry"];

  @override
  void initState() {
    super.initState();
    fromDate = DateTime.now();
    toDate = DateTime.now().add(Duration(days: 4));
    calculateDateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable Schedule'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Select Date Range:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: fromDate!,
                          firstDate: DateTime(2000),
                          lastDate: toDate!,
                        );
                        if (selectedDate != null) {
                          setState(() {
                            fromDate = selectedDate;
                            calculateDateList();
                          });
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('From Date'),
                          SizedBox(width: 5),
                          Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: toDate!,
                          firstDate: fromDate!,
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            toDate = selectedDate;
                            calculateDateList();
                          });
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('To Date'),
                          SizedBox(width: 5),
                          Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 2,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: DataTable(
                      columnSpacing: 20.0,
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Day/Period')),
                        for (var period in periods) DataColumn(label: Text(period)),
                      ],
                      rows: [
                        for (int i = 0; i < days.length; i++)
                          DataRow(
                            cells: [
                              DataCell(Text(dateList.isNotEmpty ? formatDate(dateList[i]) : '')), // Display formatted date
                              DataCell(Text(days[i])), // Populated day names
                              for (var _ in periods)
                                DataCell(
                                  Center(
                                    child: Text(
                                      generateTimetableEntry(),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }


  String generateTimetableEntry() {
    var rng = Random();
    var subject = subjects[rng.nextInt(subjects.length)];
    return subject;
  }

  void calculateDateList() {
    if (fromDate != null && toDate != null) {
      dateList.clear();
      for (var i = 0; i < days.length; i++) {
        final date = fromDate!.add(Duration(days: i));
        dateList.add(date);
      }
    }
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}';
  }
}