 import 'package:crime_track_master/Pages/signup.dart';
import 'package:crime_track_master/Pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../police/widgetsPolice/navigation_menu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

    class _LoginPageState extends State<LoginPage> {
    // Add state variables here if needed

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFCD1313),
                  Color(0xFFDE5E5E),
                  Color(0xFF655EDE),
                  Color(0xFF010375),
    ]),

    ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              SizedBox(height: 60,),
              Image.asset( "images/logo.png"),
              SizedBox(height: 10 ,),
              Text('તમારી સુરક્ષા અમારી જવાબદારી છે',
              style: TextStyle(
                color: Colors.lightGreenAccent,
                fontSize: 25,
              ),
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height/2.3,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text('Please login to your account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 270,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(), // Replace with your sign-up page widget
                                ),
                              );
                            },
                            child: Text(
                              'Sign up as new user',
                              style: TextStyle(
                                fontWeight: FontWeight.w500 ,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NavigationMenu()),
                        );
                      },
                      child: Container(
                        alignment:  Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight ,
                                colors: [
                                  Color(0xFF010375),
                                  Color(0xFF655EDE),
                                  Color(0xFFDE5E5E),
                                  Color(0xFFCD1313),
                                ]
                            )
                        ) ,
                        child: Padding(padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                          child: Text('Click on this button to login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ) ,
    ) ;
  }
}
