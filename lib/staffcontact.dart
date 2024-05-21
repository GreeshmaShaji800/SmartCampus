import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/controller/provider.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:smartcampusloginpage/squrebox.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    final staff=Provider.of<staffprovider>(context,listen: false);
    staff.getStaffData();
    // TODO: implement initState
    super.initState();
  }
  final List<Map<String, dynamic>> workers = [
    {'phone': '9633277629',},
    {'phone': '987-654-3210',},
    {'phone': '9987654320',},
    {'phone': '9234567890',},
    {'phone': '9876543210',},
    {'phone': '8765432109',},
    {'phone': '9087654321',},
    {'phone': '7890123456',},
    {'phone': '8901234567',},
    {'phone': '9012345678',},
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
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: height/4,
            width: double.infinity,
            color: Color(0xff6D4DBF),
            child: Stack(
              children: [
                SquareBox(color1: Color(0xff6D4DBF), color2: Color(0xff7E67D1), height: height, width: width),
                Align(alignment: Alignment.bottomCenter
                  ,child: Container(
                    height: height/35,
                    width: double.infinity,
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
                  ),
                ),
                Positioned(
                  top: height/10,right: width/3.5,
                  child: Text('Staff Contact',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                    ,fontSize: 25,),),
                ),

                Positioned(
                  top: height/11.5,
                  left: width/18,
                  child: Container(
                    height: height/17,
                    width: height/17,
                    decoration: BoxDecoration(border: Border.all(

                        color: Colors.grey
                    ),borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },

                        child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  ),
                ),
              ],

            )
          ),
          Consumer<staffprovider>(builder: (context, staffProvider, child) => Expanded(
            child: ListView.builder(
              itemCount: staffProvider.data!.result.length,
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
                    title: Text(staffProvider.data!.result[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subject: ${staffProvider.data!.result[index].teachingSubjectName}'),
                        Text('Designation: ${staffProvider.data!.result[index].isTeachingStaff ? "Teaching Staff":"Non Teaching Staff"}'),
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

                      ],
                    ),
                  ),
                );
              },
            ),
          ),)
        ],
      ),
    );
  }
}
