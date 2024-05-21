import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';

import 'examhome.dart';

void main() {
  runApp(MaterialApp(
    home: FeePaymentScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FeePaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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


                SquareBox(
                    color1: Color(0xff6D4DBF),
                    color2: Color(0xff7E67D1),
                    height: height,
                    width: width),
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
                    'Fee Payment',
                    style: TextStyle(color: Colors.white, fontSize: 25),
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
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SemesterFeeDetailsPage(),
          ),
        ],
      ),
    );
  }
}

class SemesterFeeDetailsPage extends StatefulWidget {
  @override
  _SemesterFeeDetailsPageState createState() => _SemesterFeeDetailsPageState();
}

class _SemesterFeeDetailsPageState extends State<SemesterFeeDetailsPage> {
  Map<String, int> _payableAmounts = {
    'June': 0,
    'July': 0,
    'August': 0,
    'September': 0,
    'October': 0,
    'November': 0,
    'December': 0,
    'January': 0,
    'February': 0,
    'March': 0,
  };

  Map<String, bool> _selectedMonths = {
    'June': false,
    'July': false,
    'August': false,
    'September': false,
    'October': false,
    'November': false,
    'December': false,
    'January': false,
    'February': false,
    'March': false,
  };

  int _totalPayableAmount = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FixedColumnWidth(50),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
                      4: FixedColumnWidth(120),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Select'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Installments'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Total Amount'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Payable Amount'),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Details'),
                            ),
                          ),
                        ],
                      ),
                      for (int i = 0; i < _selectedMonths.length; i++)
                        TableRow(
                          children: [
                            TableCell(
                              child: Checkbox(
                                value: _selectedMonths.values.toList()[i],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _selectedMonths[_selectedMonths.keys
                                        .toList()[i]] = value ?? false;
                                    if (value == true) {
                                      _payableAmounts[
                                      _selectedMonths.keys.toList()[i]] =
                                          getTotalAmountForMonth(
                                              _selectedMonths.keys.toList()[i]);
                                    } else {
                                      _payableAmounts[
                                      _selectedMonths.keys.toList()[i]] = 0;
                                    }
                                    _calculateTotalPayableAmount();
                                  });
                                },
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(_selectedMonths.keys.toList()[i]),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(getTotalAmountForMonth(
                                    _selectedMonths.keys.toList()[i])
                                    .toString()),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    _showPayableAmountDialog(
                                        _selectedMonths.keys.toList()[i]);
                                  },
                                  child: Text(_payableAmounts[
                                  _selectedMonths.keys.toList()[i]]
                                      .toString()),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: height / 20,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showFeeDetailsDialog(
                                          _selectedMonths.keys.toList()[i]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xff6D4DBF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text('Details'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: height / 50),
          Text(
            'Total Paying Amount: $_totalPayableAmount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height / 50),
          ElevatedButton(
            onPressed: () {
              // Handle proceed to pay button press
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xff6D4DBF),
            ),
            child: Text('Proceed to Pay'),
          ),
        ],
      ),
    );
  }

  void _showPayableAmountDialog(String month) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int currentAmount = _payableAmounts[month] ?? 0;
        return AlertDialog(
          title: Text('Enter Payable Amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
            onChanged: (String value) {
              setState(() {
                _payableAmounts[month] = int.tryParse(value) ?? 0;
                _calculateTotalPayableAmount();
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_payableAmounts[month] == 0) {
                  _payableAmounts[month] = getTotalAmountForMonth(month);
                  _calculateTotalPayableAmount();
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _calculateTotalPayableAmount() {
    int totalPayableAmount = 0;
    _selectedMonths.forEach((month, isSelected) {
      if (isSelected) {
        totalPayableAmount += _payableAmounts[month] ?? 0;
      }
    });
    setState(() {
      _totalPayableAmount = totalPayableAmount;
    });
  }

  void _showFeeDetailsDialog(String month) {
    Map<String, int> monthFees = getFeesForMonth(month);

    List<Widget> feeWidgets = [];
    monthFees.forEach((feeType, feeAmount) {
      feeWidgets.add(
        ListTile(
          title: Text(feeType),
          trailing: Text('\$$feeAmount'),
        ),
      );
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fee Details - $month'),
          content: SingleChildScrollView(
            child: ListBody(
              children: feeWidgets,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  int getTotalAmountForMonth(String month) {
    Map<String, Map<String, int>> fees = {
      'June': {
        'Tuition Fee': 2500,
        'Admission Fee': 1000,
        'Uniform Fee': 1500,
        'Bus Fee': 500
      },
      'July': {'Tuition Fee': 2500, 'Sports Fee': 2000, 'Bus Fee': 500},
      'August': {
        'Tuition Fee': 2500,
        'Library Fee': 500,
        'Bus Fee': 500,
        'Sports Fee': 500
      },
      'September': {'Tuition Fee': 2500, 'Lab Fee': 500, 'Bus Fee': 500},
      'October': {'PTA Fund': 2500, 'Tuition Fee': 2500, 'Bus Fee': 500},
      'November': {'Tuition Fee': 2500, 'Lab Fee': 500, 'Bus Fee': 500},
      'December': {'Tuition Fee': 2500, 'Bus Fee': 500},
      'January': {'Bus Fee': 500, 'Computer Fee': 1000, 'Tuition Fee': 2500},
      'February': {'Bus Fee': 500, 'Tuition Fee': 2500},
      'March': {'Bus Fee': 500, 'Exam Fee': 2500, 'Tuition Fee': 2500},
    };
    int totalAmount = 0;
    fees[month]?.forEach((key, value) {
      totalAmount += value;
    });
    return totalAmount;
  }

  Map<String, int> getFeesForMonth(String month) {
    Map<String, Map<String, int>> fees = {
      'June': {
        'Tuition Fee': 2500,
        'Admission Fee': 1000,
        'Uniform Fee': 1500,
        'Bus Fee': 500
      },
      'July': {'Tuition Fee': 2500, 'Sports Fee': 2000, 'Bus Fee': 500},
      'August': {
        'Tuition Fee': 2500,
        'Library Fee': 500,
        'Bus Fee': 500,
        'Sports Fee': 500
      },
      'September': {'Tuition Fee': 2500, 'Lab Fee': 500, 'Bus Fee': 500},
      'October': {'PTA Fund': 2500, 'Tuition Fee': 2500, 'Bus Fee': 500},
      'November': {'Tuition Fee': 2500, 'Lab Fee': 500, 'Bus Fee': 500},
      'December': {'Tuition Fee': 2500, 'Bus Fee': 500},
      'January': {'Bus Fee': 500, 'Computer Fee': 1000, 'Tuition Fee': 2500},
      'February': {'Bus Fee': 500, 'Tuition Fee': 2500},
      'March': {'Bus Fee': 500, 'Exam Fee': 2500, 'Tuition Fee': 2500},
    };
    return fees[month] ?? {};
  }
}