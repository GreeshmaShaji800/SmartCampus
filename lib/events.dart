import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:table_calendar/table_calendar.dart';



class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Events> {
  DateTime? _selectedDate;
  List<String> _events = [];

  // Define your events map here
  Map<DateTime, List<String>> eventsMap = {
    DateTime.utc(2024, 3, 13): ['School Fest'],     // School Fest on March 13th
    DateTime.utc(2024, 4, 23): ['Sports Event'],    // Sports Event on March 23rd
    DateTime.utc(2024, 5, 10): ['Art Exhibition'],  // Art Exhibition on April 10th
    DateTime.utc(2024, 5, 25): ['Music Concert'],   // Music Concert on April 25th
    DateTime.utc(2024, 7, 15): ['Video Games'],     // Multiple events on April 25th
    // Add events for other dates
  };

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
          onPressed: () {},
          color: Colors.white,
        ),
        title: Text(
          'Events',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              // Required parameters
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(), // Set the currently focused day
              selectedDayPredicate: (day) {
                // Use this to determine if a day is selected
                return _selectedDate != null && isSameDay(_selectedDate!, day);
              },
              eventLoader: (day) => eventsMap[day] ?? [],
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _events = eventsMap[selectedDay] ?? [];
                });
              },
              availableGestures: AvailableGestures.none, // Disable swipe gestures
              // Customize properties as needed
              // Add your customization here
            ),
            Container(
              height: 2.0, // Adjust the thickness of the line
              color: Colors.grey.withOpacity(0.5), // Semi-bold line color
            ),
            SizedBox(height: 10),
            if (_selectedDate != null && _events.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Events for ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _events.length,
                      itemBuilder: (context, index) {
                        final event = _events[index];
                        IconData iconData = Icons.event;
                        switch (event) {
                          case 'School Fest':
                            iconData = Icons.school;
                            break;
                          case 'Sports Event':
                            iconData = Icons.sports_baseball_rounded;
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
                        }
                        return ListTile(
                          leading: Icon(
                            iconData,
                            color: Colors.white,
                          ),
                          title: Text(
                            event,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
