import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final List<Map<String, dynamic>> workers = [
    {
      'name': 'John Doe',
      'class': 'Mathematics',
      'designation': 'Teacher',
      'phone': '123-456-7890',
    },
    {
      'name': 'Jane Smith',
      'class': 'Science',
      'designation': 'Teacher',
      'phone': '987-654-3210',
    },
    {
      'name': 'Mahima Nambyar',
      'class': 'Physics',
      'designation': 'Teacher',
      'phone': '9987654320',
    },
    {
      'name': 'Alice Johnson',
      'class': 'English',
      'designation': 'Teacher',
      'phone': '1234567890',
    },
    {
      'name': 'Bob Williams',
      'class': 'History',
      'designation': 'Teacher',
      'phone': '9876543210',
    },
    {
      'name': 'Ella Brown',
      'class': 'Chemistry',
      'designation': 'Teacher',
      'phone': '8765432109',
    },
    {
      'name': 'David Lee',
      'class': 'Biology',
      'designation': 'Teacher',
      'phone': '9087654321',
    },
    {
      'name': 'Sarah Miller',
      'class': 'Geography',
      'designation': 'Teacher',
      'phone': '7890123456',
    },
    {
      'name': 'Michael Davis',
      'class': 'Art',
      'designation': 'Teacher',
      'phone': '8901234567',
    },
    {
      'name': 'Olivia Wilson',
      'class': 'Music',
      'designation': 'Teacher',
      'phone': '9012345678',
    },
    // Add more workers as needed
  ];

  void _makePhoneCall(String phoneNumber) async {
    String telScheme = 'tel:$phoneNumber';
    if (await canLaunch(telScheme)) {
      await launch(telScheme);
    } else {
      throw 'Could not launch $telScheme';
    }
  }

  void _saveContact(String name, String phone) {
    // Add functionality to save contact
    print('Saving contact: $name, $phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          centerTitle: true, // Title moved to the center
          flexibleSpace: Container(
            decoration: BoxDecoration(
             color: Colors.indigo
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'St George School',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18, // Adjusting the font size
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Teaching And non teaching staff contacts',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            'Schools Contact',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: workers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    title: Text(workers[index]['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Class: ${workers[index]['class']}'),
                        Text('Designation: ${workers[index]['designation']}'),
                        Text('Phone: ${workers[index]['phone']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            _makePhoneCall(workers[index]['phone']);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.save,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            _saveContact(
                              workers[index]['name'],
                              workers[index]['phone'],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
