import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/profilpage.dart';
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/squrebox.dart';

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
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Container(
                height:height/4 ,
                width: double.infinity,
                color: Color(0xff6D4DBF),

                child: Stack(
                  children: [
                    SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                    Align(alignment: Alignment.bottomCenter
                      ,child: Container(
                        height: height/25,
                        width: double.infinity,
                        decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        )),
                      ),
                    ),
                    Center(
                      child: Text('Personal Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                    ),
                    Positioned(
                      top: height/9.9,
                      left: width/12,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));

                        },
                        child: Container(
                          height: height/17,
                          width: height/18,
                          decoration: BoxDecoration(border: Border.all(
                              color: Colors.grey
                          ),borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<userprovide>(builder: (context, personaldata, child) => Container(
                    padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Stack(
                              children: const [
                                SizedBox(height: 70),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/img1.png'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          buildTextField("Full Name", personaldata.Name.toString(), Icons.person, false),
                          buildTextField("Email", personaldata.email.toString(), Icons.email, false),
                          buildTextField("DOB", DateFormat.yMMMEd().format(personaldata.dateofbirth), Icons.calendar_today, false),
                          buildTextField("Age", personaldata.age.toString(), Icons.person_outline, false),
                          buildTextField("Father name", personaldata.fathername.toString(), Icons.person_outline, false),
                          buildTextField("Mother name", personaldata.mothername.toString(), Icons.person_outline, false),
                          buildTextField("Adhar no", personaldata.adharno.toString(), Icons.person_outline, false),
                          buildTextField("Address", personaldata.address.toString(), Icons.person_outline, false),
                          // buildTextField("Religion", personaldata.religion.toString(), Icons.person, false),
                          Visibility(
                            visible: !showMoreDetails,
                            child:
                            buildTextField("Gender", "Female", Icons.people_alt, false),
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
                  ),)
                ),
              ),
            ],
          ),
        ),

    );
  }
}