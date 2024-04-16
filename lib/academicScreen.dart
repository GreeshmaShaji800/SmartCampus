import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Profileacademic (),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class Profileacademic extends StatefulWidget {
  const Profileacademic ({Key? key}) : super(key: key);

  @override
  State<Profileacademic > createState() => _ProfileState();
}

class _ProfileState extends State<Profileacademic > {
  bool isObscurePassword = true;
  bool showMoreDetails = false;

  Widget buildTextField(String labelText, String placeholder, IconData iconData, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              readOnly: true, // Make the text field non-editable
              controller: TextEditingController(text: placeholder), // Set the default value
              decoration: InputDecoration(
                suffixIcon: isPasswordTextField ?
                IconButton(
                  icon: const Icon(Icons.remove_red_eye, color: Colors.blue),
                  onPressed: () {},
                ) : null,
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: const [
                    SizedBox(height: 70),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('lib/assets/img.png'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField("Year of Admission", "2023", Icons.school_rounded, false),
              buildTextField("Course", "Electronics", Icons.book, false),
              buildTextField("Department", "Bsc", Icons.school, false),
              buildTextField("Semester/Term", "2", Icons.school_outlined, false),
              Visibility(
                visible: !showMoreDetails,
                child:
                buildTextField("Gender", "Female", Icons.people_alt, false),
              ),
              Visibility(
                visible: showMoreDetails,
                child: Column(
                  children: [


                    buildTextField("Hod Name", "Praveen", Icons.person, false),
                    buildTextField("Class Teacher Name", "Reji", Icons.person, false),
                    buildTextField("Academic Year", "2023-2026", Icons.calendar_today, false),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showMoreDetails = !showMoreDetails;
                  });
                },
                child: Text(
                  showMoreDetails ? 'Less' : 'More',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  // Implement your action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Set the button color to Indigo
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white), // Change the text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}