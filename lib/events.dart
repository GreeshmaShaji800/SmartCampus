import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:table_calendar/table_calendar.dart';

import 'controller/eventprovider.dart';

void main() {
  runApp(MaterialApp(
    home: Events(),
  ));
}

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Events> {
  @override

  @override
  DateTime? _selectedDate;
  List<String> _events = [];
  DateTime _focusedDay = DateTime.now(); //DateTime.utc(2024, 4, 1); // Initially focus on April 2024

  // Define your events map here
  Map<DateTime, List<String>> eventsMap = {
    DateTime.utc(2024, 3, 13): ['School Fest'],
    DateTime.utc(2024, 4, 23): ['Sports Event'],
    DateTime.utc(2024, 5, 10): ['Art Exhibition'],
    DateTime.utc(2024, 5, 25): ['Music Concert'],
    DateTime.utc(2024, 7, 15): ['Video Games'],
  };

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    Map<DateTime, List<String>> eventMap = {
      for (int i = 0; i < eventProvider.data!.result.items.length; i++)
        eventProvider.data!.result.items[i].start: [eventProvider.data!.result.items[i].title]
    };
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
                          color2: Color(0xf7E67D1),
                          height: height,
                          width: width),
                      // You should replace 'SquareBox' with your custom widget or remove it
                      // SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
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
                          'Events',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: height / 9.9,
                        left: width / 12,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: Container(
                            height: height / 17,
                            width: height / 18,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // TableCalendar widget
                TableCalendar(
                  // Required parameters
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return _selectedDate != null && isSameDay(_selectedDate!, day);
                  },
                  eventLoader: (day) => eventMap[day] ?? [],
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _events = eventMap[selectedDay] ?? [];
                      // Update the focused day to be the selected day
                      _focusedDay = selectedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month,
                  availableCalendarFormats: {
                    CalendarFormat.month: 'Month',
                  },
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                      color: Color(0xFFE91E63),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    formatButtonVisible: false, // Hide the format button
                    titleCentered: true, // Align the title to the center
                  ),
                ),

                if (_selectedDate != null && _events.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: height / 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Events on ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff6D4DBF),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _events.length,
                              itemBuilder: (context, index) {
                                final event = _events[index];
                                IconData iconData = Icons.event;

                                switch (event) {
                                  case 'School Fest':
                                    iconData = Icons.school;
                                    break;
                                  case 'Sports Event':
                                    iconData = Icons.sports_baseball;
                                    break;
                                  case 'Art Exhibition':
                                    iconData = Icons.palette;
                                    break;
                                  case 'Music Concert':
                                    iconData = Icons.music_note;
                                    break;
                                  case 'Video Games':
                                    iconData = Icons.sports_esports;
                                    break;
                                  default:
                                    iconData = Icons.event;
                                    break;
                                }

                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        iconData,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        event,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
    }
}
