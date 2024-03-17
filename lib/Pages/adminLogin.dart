
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../citizen/navigation_bar.dart';
import '../police/widgetsPolice/navigation_menu.dart';
class adLoginPage extends StatefulWidget {
  @override
  _adLoginPageState createState() => _adLoginPageState();
}

class _adLoginPageState extends State<adLoginPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController staffIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add form key for validation

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(), // Apply Google Font to the text theme
        primaryColor: Color(0xFF7B0305), // Change primary color to red
        inputDecorationTheme:  InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7B0305)),
            borderRadius: BorderRadius.circular(30.0),
          ),
          labelStyle: TextStyle(
            color: Colors.black, // Change label color
          ),
        ),
      ),
      child:Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            'Login as Admin',
                            style: TextStyle(
                              fontSize: 25,
                              // Consider using app theme colors or consistent styling
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          cursorColor: Color(0xFF7B0305),
                          controller: staffIdController,
                          decoration: InputDecoration(
                            labelText: 'Staff ID',
                            prefixIcon: Icon(
                              FontAwesomeIcons.idCard,
                              size: 17,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Staff ID';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          cursorColor: Color(0xFF7B0305),
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Admin ID',
                            prefixIcon: Icon(
                              FontAwesomeIcons.user,
                              size: 17,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          cursorColor: Color(0xFF7B0305),
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              FontAwesomeIcons.lock,
                              size: 17,
                            ),
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
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
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
                                if(emailController.text=='police@gmail.com'&& passwordController.text=='Police123') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                          context) => const NavigationMenu(),
                                    ),
                                  );
                                }else {
                                  print(Text("Wrong Email And Password"));
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              overlayColor: MaterialStateProperty.resolveWith((states) {
                                // Set overlay color based on button states
                                if (states.contains(MaterialState.pressed)) {
                                  // When button is pressed
                                  return Colors.transparent; // No overlay color when pressed
                                }
                                // Normal state
                                return Colors.black12; // Default overlay color
                              }),
                              elevation: MaterialStateProperty.all<double>(0), // No elevation
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
