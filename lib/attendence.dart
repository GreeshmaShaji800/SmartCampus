import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';
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
    _selectedDay = DateTime.now();
    _initializePeriods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
              child: Icon(Icons.arrow_back)),
          onPressed: () {
            // Add your navigation logic here
          },
          color: Colors.white,
        ),
        title: Text(
          "Attendance",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
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
                    if (date.weekday == DateTime.saturday || date.weekday == DateTime.sunday||date.day == DateTime.monday||date.day == DateTime.thursday)
                      Positioned(
                        left: 2,
                        right: 2,
                        bottom: 2,

                        child: Container(
                          width: 8,
                          height: 8,
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
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Day: ${_selectedDay.toString()}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
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
    );
  }

  void _initializePeriods() {
    totalPeriods = Map.fromIterable(
      _getCalendarDays(),
      key: (day) => day,
      value: (_) => 6, // Set total period to 6 for all dates
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
    // Set attended periods based on the selected day
    attendedPeriods = {
      selectedDay: selectedDay.day % 6, // Example: Attended period is set to the remainder of the day divided by 6
    };
  }
}


