import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartcampusloginpage/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:smartcampusloginpage/provider_class.dart';
import 'package:smartcampusloginpage/tokenclass/tokenpage.dart';
import 'bottomnavigation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Token tokenController = Token();
  final TextEditingController _emailController = TextEditingController(text: 'anuemmanuel');
  final TextEditingController _passwordController = TextEditingController(text: "anu123");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more email validation if needed
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    // You can add more password validation if needed
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with login
      print('Login Pressed');
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }
  var token;
  var username;
  var password;
  var tenancyname= "sfsetr";

  void logindata(String username,String password)async{
    var Url='https://sfsetr.smartcampus.co/api/Account/Authenticate';
    var uri = Uri.parse(Url);
    var response = await http.post(uri,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode(<String,dynamic>{
      "UsernameOrEmailAddress": username,
      "Password": password,
      "TenancyName": tenancyname,
    }));
    if (response.statusCode==200){
      final tokendata=jsonDecode(response.body);
      print('************************************* $tokendata ');
      token = tokendata['result'];
      print('......................................$token');
      var Userdatatoken = Provider.of<userprovide>(context,listen: false);
      Userdatatoken.Token = tokendata['result'];


     await Userdatatoken.getProfileData();
     await Userdatatoken.getProfilepagedata();
     // await Userdatatoken.getEmaildata();



    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NavigationBar1(),
    ));
  }}
  Widget buildEmail() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xff2D002D),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: _validateEmail,
      ),
    );
  }

  Widget buildPassword() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xff2D002D),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: _validatePassword,
      ),
    );
  }



  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        },
        child: ElevatedButton(
          onPressed: () {
            _submitForm();
            username=_emailController.text;
            password=_passwordController.text;
            logindata(username,password);


          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.indigo),
          ),
          child: Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up pressed'),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an Account?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 460,
              width: 250,
              padding: EdgeInsets.symmetric(vertical: 100),
              decoration: BoxDecoration(
                  color:Colors.white ,
                  image: DecorationImage(image: AssetImage('lib/assets/Parents-pana.png',),fit: BoxFit.fill)

              ),

              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ),
          ),
          Positioned(
            top: 470, // Adjust as needed to position the content below the app bar
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildEmail(),
                      SizedBox(height: 40),
                      buildPassword(),

                      buildLoginBtn(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
