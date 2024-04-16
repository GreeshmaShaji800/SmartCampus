import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FeePaymentScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FeePaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Payment', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent, // Set transparent color
        flexibleSpace: Container(
          decoration: BoxDecoration(
           color: Colors.indigo
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Details'),
                  value: 'details',
                ),
                PopupMenuItem(
                  child: Text('Receipts'),
                  value: 'receipts',
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'details') {
                // Navigate to Details screen
              } else if (value == 'receipts') {
                // Navigate to Receipts screen
              }
            },
          ),
        ],
      ),
      body: SemesterFeeDetailsPage(),
    );
  }
}

class SemesterFeeDetailsPage extends StatefulWidget {
  @override
  _SemesterFeeDetailsPageState createState() => _SemesterFeeDetailsPageState();
}

class _SemesterFeeDetailsPageState extends State<SemesterFeeDetailsPage> {
  // Map to store payable amounts for each semester
  Map<String, int> _payableAmounts = {
    'Semester 1': 0,
    'Semester 2': 0,
    'Semester 3': 0,
    'Semester 4': 0,
    'Semester 5': 0,
    'Semester 6': 0,
  };

  // Map to store the selected state of each checkbox
  Map<String, bool> _selectedSemesters = {
    'Semester 1': false,
    'Semester 2': false,
    'Semester 3': false,
    'Semester 4': false,
    'Semester 5': false,
    'Semester 6': false,
  };

  @override
  Widget build(BuildContext context) {
    // Calculate total payable amount for selected semesters
    int totalPayableAmount = 0;
    _selectedSemesters.forEach((key, value) {
      if (value) {
        totalPayableAmount += _payableAmounts[key] ?? 0;
      }
    });

    return Padding(
      padding: const EdgeInsets.only(top: 60.0), // Add space between app bar and table
      child: Column(
        children: [
          Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FixedColumnWidth(50), // Set width of Select column
              1: FlexColumnWidth(1), // Let Installment column take remaining width
              2: FlexColumnWidth(1), // Let Total Amount column take remaining width
              3: FlexColumnWidth(1), // Let Payable Amount column take remaining width
              4: FixedColumnWidth(120), // Set width of Details column
            },
            children: [
              TableRow(
                children: [
                  TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Select'))),
                  TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Installment'))),
                  TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Total Amount'))),
                  TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Payable Amount'))),
                  TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Details'))),
                ],
              ),
              for (int i = 0; i < 6; i++)
                TableRow(
                  children: [
                    TableCell(
                      child: Checkbox(
                        value: _selectedSemesters['Semester ${i + 1}'] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            _selectedSemesters['Semester ${i + 1}'] = value ?? false;
                          });
                        },
                      ),
                    ),
                    TableCell(child: Padding(padding: EdgeInsets.all(8.0), child: Text('Semester ${i + 1}'))),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(getTotalAmountForSemester('Semester ${i + 1}').toString()),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            _showPayableAmountDialog('Semester ${i + 1}');
                          },
                          child: Text(_payableAmounts['Semester ${i + 1}'].toString()),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity, // Make button fill the entire cell horizontally
                          height: 40, // Set fixed height for button
                          child: ElevatedButton(
                            onPressed: () {
                              _showFeeDetailsDialog('Semester ${i + 1}');
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // <-- rectangle border radius
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
          SizedBox(height: 20), // Add space between table and total amount
          Text(
            'Total Paying Amount: $totalPayableAmount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), // Add space between total amount and button
          ElevatedButton(
            onPressed: () {
              // Handle proceed to pay button press
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue// Set button color to blue
            ),

            child: Text('Proceed to Pay'),
          ),
        ],
      ),
    );
  }

  // Function to show dialog for entering payable amount
  void _showPayableAmountDialog(String semester) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Payable Amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
            onChanged: (String value) {
              setState(() {
                _payableAmounts[semester] = int.tryParse(value) ?? 0;
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
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to show dialog with fee details for a semester
  void _showFeeDetailsDialog(String semester) {
    Map<String, int> semesterFees = getFeesForSemester(semester);

    List<Widget> feeWidgets = [];
    semesterFees.forEach((feeType, feeAmount) {
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
          title: Text('Fee Details - $semester'),
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

  // Function to get total amount for a semester
  int getTotalAmountForSemester(String semester) {
    Map<String, Map<String, int>> fees = {
      'Semester 1': {'Tuition Fee': 25000, 'Admission Fee': 5500, 'Uniform Fee': 3750},
      'Semester 2': {'Tuition Fee': 26000, 'Computer Fee': 5000, 'Sports Fee': 2000},
      'Semester 3': {'Tuition Fee': 27000, 'Library Fee': 1500, 'Sports Fee': 2000},
      'Semester 4': {'Tuition Fee': 28000, 'Lab Fee': 2500},
      'Semester 5': {'Tuition Fee': 29000, 'Extracurricular Fee': 1000},
      'Semester 6': {'Tuition Fee': 30000, 'Project Fee': 5000},
    };
    int totalAmount = 0;
    fees[semester]?.forEach((key, value) {
      totalAmount += value;
    });
    return totalAmount;
  }

  // Function to get fees for a semester
  Map<String, int> getFeesForSemester(String semester) {
    Map<String, Map<String, int>> fees = {
      'Semester 1': {'Tuition Fee': 25000, 'Admission Fee': 5500, 'Uniform Fee': 3750},
      'Semester 2': {'Tuition Fee': 26000, 'Computer Fee': 5000, 'Sports Fee': 2000},
      'Semester 3': {'Tuition Fee': 27000, 'Library Fee': 1500, 'Sports Fee': 2000},
      'Semester 4': {'Tuition Fee': 28000, 'Lab Fee': 2500},
      'Semester 5': {'Tuition Fee': 29000, 'Extracurricular Fee': 1000},
      'Semester 6': {'Tuition Fee': 30000, 'Project Fee': 5000},
    };
    return fees[semester] ?? {};
  }
}