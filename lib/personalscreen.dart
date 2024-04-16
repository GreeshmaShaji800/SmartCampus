import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcampusloginpage/homescreen.dart';

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
      home: const Profile(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          title: const Text(
            'Personal Details',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.indigo,
          leading: IconButton(
            icon: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                },
                child: const Icon(Icons.arrow_back,color: Colors.white,)),
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
                buildTextField("Full Name", "Anu Emmanuel", Icons.person, false),
                buildTextField("Email", "mariasimon@gmail.com", Icons.email, false),
                buildTextField("DOB", "14/05/2001", Icons.calendar_today, false),
                buildTextField("Age", "23", Icons.person_outline, false),
                Visibility(
                  visible: !showMoreDetails,
                  child:
                  buildTextField("Gender", "Female",

                      Icons.people_alt, false),
                ),
                Visibility(
                  visible: showMoreDetails,
                  child: Column(
                    children: [
                      buildTextField("Gender", "Female", Icons.people_alt, false),
                      buildTextField("Caste", "Christian", Icons.bookmark, false),
                      buildTextField("Religion", "RC", Icons.book, false),
                      buildTextField("Nationality", "Indian", Icons.language, false),
                      buildTextField("State", "Kerala", Icons.location_city, false),
                      buildTextField("Address", "Kunnath House", Icons.location_on, false),
                      buildTextField("Father Name", "Simon", Icons.people, false),
                      buildTextField("Mother Name", "Sofy", Icons.people, false),
                      buildTextField("Local Guardian Name", "", Icons.people, false),
                      buildTextField("Martial Status", "Unmarried", Icons.people, false),
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Implement your action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              // Set the button color to Indigo
            ),
            child: Text(
              'Go Back',
              style: TextStyle(color: Colors.white),
            )   ,
          ),
        )
    );
  }
}