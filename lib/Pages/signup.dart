import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../citizen/navigation_bar.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final mobileController=TextEditingController();
  final passwordController=TextEditingController();
  final emergencycontacts1=TextEditingController();
  final emergencycontacts2=TextEditingController();
  final emergencycontacts3=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  bool _obscureText =true ;
  String? selectedGender;

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

    ]),

    ),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
    child: Container(
    height: MediaQuery.of(context).size.height/1.15,
    width: MediaQuery.of(context).size.width*0.9,// Adjust width as needed
    padding: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    ),
    child: Form(
    key: _formkey,
    child: Column(
    children: [
      SizedBox(height: 20),
      Text(
        'Create your account',
        style: TextStyle(
          fontSize: 25,
          // Consider using app theme colors or consistent styling
        ),
      ),
      SizedBox(height: 20),
      TextFormField(
    controller: nameController,
    decoration: const InputDecoration(
    hintText: 'Name',
    prefixIcon: Icon(Icons.person),
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your name';
    }
    return null;
    },
    ),
      TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          hintText: 'E-Mail',
          prefixIcon: Icon(Icons.email),
        ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}').hasMatch(value)) {
    return 'Please enter a valid email address';
    }
    return null;
    },
      ),
      TextFormField(
        controller: mobileController,
        decoration: const InputDecoration(
          hintText: 'Mobile Number',
          prefixIcon: Icon(Icons.phone),
        ),
    inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
    ],
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
    }
    if (value.length != 10) {
    return 'Please enter a valid 10-digit mobile number';
    }
    return null;
    },
      ),


      DropdownButtonFormField<String>(
      decoration: const InputDecoration(
      hintText: 'Gender',
      prefixIcon: Icon(Icons.person),
    ),
      value: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
      items: ['Male', 'Female', 'Other']
          .map((gender) => DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      ))
          .toList(),
    ),
      TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
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
        obscureText: _obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null; // Return null if the password is not empty
        },
      ),
      TextFormField(
        controller: emergencycontacts1,
        decoration: const InputDecoration(
          hintText: 'Emergency Contacts1',
          prefixIcon: Icon(Icons.phone),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Emergency Contacts1';
          }
          if (value.length != 10) {
            return 'Please enter a valid 10-digit Emergency Contacts1';
          }
          return null;
        },
      ),
      TextFormField(
        controller: emergencycontacts2,
        decoration: const InputDecoration(
          hintText: 'Emergency Contact2',
          prefixIcon: Icon(Icons.phone),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Emergency Contacts2';
          }
          if (value.length != 10) {
            return 'Please enter a valid 10-digit Emergency Contacts2';
          }
          return null;
        },
      ),
      TextFormField(
        controller: emergencycontacts3,
        decoration: const InputDecoration(
          hintText: 'Emergency Contacts3',
          prefixIcon: Icon(Icons.phone),
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Emergency Contacts3';
          }
          if (value.length != 10) {
            return 'Please enter a valid 10-digit Emergency Contacts3';
          }
          return null;
        },
      ),
      const SizedBox(height: 35),
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
            if (_formkey.currentState!.validate()) {
              _formkey.currentState!.save();
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              )
                  .then((value) {
                CollectionReference collref = FirebaseFirestore.instance.collection('profile');
                collref.doc(emailController.text.toLowerCase()).set({
                  'email': emailController.text.toLowerCase(),
                  'emergencyContact1':emergencycontacts1.text,
                  'emergencyContact2':emergencycontacts2.text,
                  'emergencyContact3':emergencycontacts3.text,
                  'gender': selectedGender,
                  'mobile': mobileController.text,
                  'name': nameController.text,
                  'password': passwordController.text,

                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    LoginPage(),
                  ),
                );
              }).catchError((error) {
                String errorMessage = 'Signup failed. Please try again later.';
                if (error is FirebaseAuthException) {
                  errorMessage = error.message ?? errorMessage;
                }
                _showErrorDialog(context, errorMessage);
              });
            }
            else {
              _showErrorDialog(context, 'Please fix the errors in the form.');
            }
          },
          child: const Text('Signup'),
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              // You can set different colors for different states if needed
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.transparent; // Transparent color for normal state
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              // Set text color based on button states
              if (states.contains(MaterialState.pressed)) {
                // When button is pressed
                return Colors.white; // Text color when pressed
              }
              // Normal state
              return Colors.white; // Default text color is white
            }),
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
      ),
    ],
    ),
    ),
    ),
        ),
        ),
    ),
        ),
    );
  }
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('Okay'),
          )
        ],
      ),
    );
  }

}