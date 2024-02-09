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
                  validator: validateEmail, // Use validateEmail method (if defined)
                ),

                SizedBox(height: 20),

                // Password field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: Icon(
                      FontAwesomeIcons.eyeSlash),
                  ),
                  obscureText: true,
                  onSaved: (value) => _password = value!,
                  validator: validatePassword, // Use validatePassword method (if defined)
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

                SizedBox(height: 20),

                // Sign-up button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle sign-up logic here (e.g., API call)
                      print('Email: $_email, Gender: $_gender, Password: $_password');
                    }
                  },
                  child: Text('Sign Up'),
                ),

                SizedBox(height: 20), // Adjust spacing as needed

                // Option to navigate to login page
                TextButton(
                  onPressed: () {
                    // Handle navigation to login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()), // Replace with your login page widget
                    );
                  },
                  child: Text(
                    'Already have an account? Login here',
                    style: TextStyle(
                      // Consider using app theme colors or consistent styling
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
