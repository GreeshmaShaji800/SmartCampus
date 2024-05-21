import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Consumer<userprovide>(builder: (context, academicdata, child) => Container(
              height: height/4,
              width: double.infinity,
              color: Color(0xff6D4DBF),
              child: Stack(
                children: [
                  SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                  Align(alignment: Alignment.bottomCenter
                    ,child: Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      )),

                    ),
                  ),
                  Center(
                    child: Text('School Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold
                        ,color: Colors.white),),
                  ),
                  Positioned(
                    top: height/9.9,
                    left: width/13,
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
            ),),
            Expanded(
              child: SingleChildScrollView(
                child:Consumer<userprovide>(builder: (context, academicdata, child) =>  Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, right: 15,),
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
                                backgroundImage: AssetImage('lib/assets/img.png'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        buildTextField("institutionname", academicdata.Institutionname.toString(), Icons.school_outlined, false),
                        buildTextField("Year of Admission", academicdata.academicyear.toString(), Icons.school_rounded, false),
                        buildTextField("Register NO", academicdata.batchid.toString(), Icons.book, false),
                        buildTextField("Class", academicdata.batchname.toString(), Icons.school, false),
                        buildTextField("Roll No", academicdata.rollno.toString(), Icons.school_outlined, false),

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