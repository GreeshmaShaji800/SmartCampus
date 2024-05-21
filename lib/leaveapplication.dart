import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';

class LeaveApplicationForm extends StatefulWidget {
  @override
  _LeaveApplicationFormState createState() => _LeaveApplicationFormState();
}

class _LeaveApplicationFormState extends State<LeaveApplicationForm> {
  TextEditingController _nameController = TextEditingController(text: 'anuemmanuel');
  TextEditingController _classController = TextEditingController(text:'XA');
  TextEditingController _reasonController = TextEditingController();
  DateTime? _startDate = DateTime.now();
  DateTime? _endDate;
  TextEditingController _endDateController = TextEditingController();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
        _endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: height / 10,
                    right: width / 3.5,
                    child: Text(
                      'Leave Letter ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 10,
                    left: width / 18,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Container(
                        height: height / 17,
                        width: height / 17,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Class:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _classController,
                    decoration: InputDecoration(
                      hintText: 'Enter your class',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reason for Leave:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      hintText: 'Enter reason for leave',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Start Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectStartDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('yyyy-MM-dd').format(_startDate ?? DateTime.now()),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'End Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectEndDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _endDateController.text.isNotEmpty
                                  ? _endDateController.text
                                  : 'Select end date',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextPage(
                              name: _nameController.text,
                              className: _classController.text,
                              reason: _reasonController.text,
                              startDate: DateFormat('yyyy-MM-dd').format(_startDate ?? DateTime.now()),
                              endDate: _endDateController.text.isNotEmpty ? _endDateController.text : 'Not specified',
                            ),
                          ),
                        );
                      },
                      child: Text('Submit'),
                    ),
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

class NextPage extends StatelessWidget {
  final String name;
  final String className;
  final String reason;
  final String startDate;
  final String endDate;

  NextPage({
    required this.name,
    required this.className,
    required this.reason,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    top: height / 10,
                    right: width / 4.5,
                    child: Text(
                      'Leave Status Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height / 12,
                    left: width / 18,
                    child: Container(
                      height: height / 17,
                      width: height / 17,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LeaveApplicationForm()),
                            );
                          },
                          child: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height / 4,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff6D4DBF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Name: $name',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Class: $className',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Reason for Leave: $reason',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Start Date: $startDate',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'End Date: $endDate',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Center(
                    child: Container(
                      width: width / 5,
                      height: height / 20,
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        'Approved,',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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

