import 'package:crime_track_master/Pages/adminLogin.dart';
import 'package:crime_track_master/Pages/signup.dart';
import 'package:crime_track_master/police/widgetsPolice/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../citizen/navigation_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key for validation

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
                Color(0xFFFF0000),
                Color(0xFF90CAF9),
                Color(0xFF1565C0),
                Color(0xFF7B0305),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Image.asset("images/logo.png"),
              SizedBox(height: 10),
              Text(
                'તમારી સુરક્ષા અમારી જવાબદારી છે',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'Please login to your account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 270,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              size: 17,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null; // Return null if the email is not empty
                          },
                        ),
                      ),
                      Container(
                        width: 270,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null; // Return null if the password is not empty
                          },
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
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up as new user',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, proceed with login
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              )
                                  .then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavigationMenu(),
                                  ),
                                );
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            }
                          },
                          child: Text('Log In'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              // Set background color based on button states
                              if (states.contains(MaterialState.pressed)) {
                                // When button is pressed
                                return Colors.transparent; // Use transparent color
                              }
                              // Normal state
                              return Colors.transparent; // Use transparent color
                            }),
                            overlayColor: MaterialStateProperty.resolveWith((states) {
                              // Set overlay color based on button states
                              if (states.contains(MaterialState.pressed)) {
                                // When button is pressed
                                return Colors.transparent; // No overlay color when pressed
                              }
                              // Normal state
                              return Colors.black12; // Default overlay color
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states) {
                              // Set text color based on button states
                              if (states.contains(MaterialState.pressed)) {
                                // When button is pressed
                                return Colors.white; // Text color when pressed
                              }
                              // Normal state
                              return Colors.white; // Default text color is white
                            }),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Handle navigation to login page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    adLoginPage(), // Replace with your login page widget
                              ),
                            );
                          },
                          child: Text(
                            'Login as Admin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:Colors.black ,
                              // Consider using app theme colors or consistent styling
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}