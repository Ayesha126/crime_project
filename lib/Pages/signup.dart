import 'package:cloud_firestore/cloud_firestore.dart';
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
    height: MediaQuery.of(context).size.height/1.4,
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
      const SizedBox(height: 35),
      ElevatedButton(
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();

            // Move the Firestore database update logic here
            CollectionReference collref = FirebaseFirestore.instance.collection('signup');
            collref.add({
              'name': nameController.text,
              'email': emailController.text,
              'mobile': mobileController.text,
              'gender': selectedGender,
              'password': passwordController.text,
            });

            // Navigate to the next page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomPage(),
              ),
            );
          }
        },
        child: const Text('click on this button to signup'),
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
}