import 'package:crime_track_master/citizen/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page.dart';

// Add any necessary imports for additional functionality (e.g., validation)

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Add state variables for email, gender, and password
  String _email = '';
  String _gender = 'male';
  String _password = '';

  // Validation methods (define as needed)
  String? validateEmail(String? value) {
    // Email validation logic here
    return null; // Return null if valid, otherwise an error message
  }

  String? validatePassword(String? value) {
    // Password validation logic here
    return null; // Return null if valid, otherwise an error message
  }


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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
    child: Center(
    child: Container(
      height: MediaQuery.of(context).size.height/1.4,
      width: MediaQuery.of(context).size.width*0.9,// Adjust width as needed
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Adjust alignment as needed
                  children: [
                    SizedBox(height: 20), // Adjust spacing as needed
                    Text(
                      'Create your account',
                      style: TextStyle(
                        fontSize: 25,
                        // Consider using app theme colors or consistent styling
                      ),
                    ),
                    SizedBox(height: 20),
                    // Email field
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        suffixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => _email = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: Icon(FontAwesomeIcons.eyeSlash,
                          ),
                      ),
                      obscureText: true,
                      onSaved: (value) => _password = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Gender selection
                    DropdownButtonFormField<String>(
                      value: _gender,
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: 'male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(
                          value: 'other',
                          child: Text('Other'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                    ),

                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Handle sign-up logic here (e.g., API call)
                          print('Email: $_email, Gender: $_gender, Password: $_password');
                        }
                      },
                      child: Container(
                        alignment:  Alignment.center ,
                        width: 300,
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
                        child: Padding(padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Text('Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18), // Adjust spacing as needed
                    // Option to navigate to login page
    Center(
    child: TextButton(
    onPressed: () {
    // Handle navigation to login page
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    LoginPage(), // Replace with your login page widget
    ),
    );
    },
                      child: Text(
                        'Already have an account? Login here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // Consider using app theme colors or consistent styling
                        ),
                      ),
                    ),
    )],
                ),
              ),
            ),
          ),
        )
    )
    )
    );
  }
}