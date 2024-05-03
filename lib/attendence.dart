
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Attendance> {
  late DateTime _selectedDay;
  Map<DateTime, int> totalPeriods = {};
  Map<DateTime, int> attendedPeriods = {};
  Map<DateTime, List<Widget>> events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now().subtract(Duration(days: DateTime.now().day - 1)); // Set to the first day of the current month
    _initializePeriods();
  }

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
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: SquareBox(
                        color1: Color(0xff6D4DBF),
                        color2: Color(0xff7E67D1),
                        height: height,
                        width: width),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height / 25,
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
                  Center(
                    child: Text(
                      'Attendance',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: height / 9.9,
                    left: width / 12,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Container(
                        height: height / 17,
                        width: height / 18,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height / 25),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDay, // Update focusedDay to _selectedDay
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _updatePeriods(selectedDay);
                });
              },
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              headerStyle: HeaderStyle(
                titleCentered: true, // Center the title
                titleTextStyle: TextStyle(
                  color: Color(0xFFE91E63), // Set color to pink
                  fontSize: 20,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  return Stack(
                    children: [
                      Center(
                        child: Text(
                          '${date.day}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      if (date.weekday != DateTime.saturday &&
                          date.weekday != DateTime.sunday &&
                          date.day != DateTime.monday &&
                          date.day != DateTime.thursday)
                        Positioned(
                          left: 2,
                          right: 2,
                          bottom: 2,
                          child: Container(
                            width: width / 100,
                            height: height / 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green, // Green dot for weekdays without red dots
                            ),
                          ),
                        ),
                      if (date.weekday == DateTime.saturday ||
                          date.weekday == DateTime.sunday ||
                          date.day == DateTime.monday ||
                          date.day == DateTime.thursday)
                        Positioned(
                          left: 2,
                          right: 2,
                          bottom: 2,
                          child: Container(
                            width: width / 100,
                            height: height / 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height / 15),
            Container(
              height: height / 6.6,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Day: ${_selectedDay.toString()}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6D4DBF)),
                  ),
                  SizedBox(height: height / 50),
                  Text(
                    'Total Period: ${totalPeriods[_selectedDay] ?? 0}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Attended Period: ${attendedPeriods[_selectedDay] ?? 0}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initializePeriods() {
    totalPeriods = Map.fromIterable(
      _getCalendarDays(),
      key: (day) => day,
      value: (day) {
        // Set total period to 6 for weekdays and 0 for Saturdays and Sundays
        if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday) {
          return 0;
        } else {
          return 6;
        }
      },
    );

    // Example: Initialize attended periods for demonstration
    attendedPeriods = {
      DateTime.utc(2024, 3, 1): 5,
      DateTime.utc(2024, 3, 2): 4,
      DateTime.utc(2024, 3, 3): 3,
    };
    _updatePeriods(_selectedDay);
  }

  List<DateTime> _getCalendarDays() {
    // Generate a list of days between the first and last days of the calendar
    List<DateTime> days = [];
    final DateTime firstDay = DateTime.utc(2020, 1, 1);
    final DateTime lastDay = DateTime.utc(2030, 12, 31);
    for (var day = firstDay; day.isBefore(lastDay); day = day.add(Duration(days: 1))) {
      days.add(day);
    }
    return days;
  }

  void _updatePeriods(DateTime selectedDay) {
    // Check if the selected day has a red dot (Saturday, Sunday, Monday, or Thursday)
    bool hasRedDot = selectedDay.weekday == DateTime.saturday ||
        selectedDay.weekday == DateTime.sunday ||
        selectedDay.day == DateTime.monday ||
        selectedDay.day == DateTime.thursday;

    if (!hasRedDot) {
      // Set attended periods based on the selected day
      attendedPeriods = {
        selectedDay: selectedDay.day % 6, // Example: Attended period is set to the remainder of the day divided by 6
      };
    } else {
      // If the day has a red dot, set attended periods to zero
      attendedPeriods = {
        selectedDay: 0,
      };
    }
  }
}
