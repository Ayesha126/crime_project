import 'package:crime_track_master/citizen/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'database/useremail.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emergencyContact1Controller = TextEditingController();
  TextEditingController _emergencyContact2Controller = TextEditingController();
  TextEditingController _emergencyContact3Controller = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _validateEmergencyContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter emergency contact';
    }
    if (value.length != 10) {
      return 'Emergency contact should be 10 digits';
    }
    return null;
  }

  void fetchUserProfileData() async {
    try {
      // Get the email of the logged-in user
      String loggedInUserEmail = (await getUserEmail())!;

      // Query Firestore to find the document with the matching email
      QuerySnapshot querySnapshot = await firestore
          .collection('profile')
          .where('email', isEqualTo: loggedInUserEmail)
          .get();

      // Check if the query result is not empty
      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the first document
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>

        // Set text field values with retrieved user data
        setState(() {
          _nameController.text = userData['name'] ?? '';
          _emailController.text = userData['email'] ?? '';
          _emergencyContact1Controller.text = userData['emergencyContact1'] ?? '';
          _emergencyContact2Controller.text = userData['emergencyContact2'] ?? '';
          _emergencyContact3Controller.text = userData['emergencyContact3'] ?? '';
          _mobilenumberController.text = userData['mobile'] ?? '';
        });
      }

    } catch (error) {
      print('Error fetching user profile data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    // Call method to fetch and set user profile data
    fetchUserProfileData();
  }


  void updateProfile() {
    // Get the email entered by the user
    String email = _emailController.text.toLowerCase();

    // Query Firestore to find the document with the matching email
    firestore.collection('profile').where('email', isEqualTo: email).get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Document with the matching email found
        String userId = querySnapshot.docs.first.id;

        // Get values from controllers
        String name = _nameController.text;
        String password = _passwordController.text;
        String emergencyContact1 = _emergencyContact1Controller.text;
        String emergencyContact2 = _emergencyContact2Controller.text;
        String emergencyContact3 = _emergencyContact3Controller.text;
        String mobilenumber = _mobilenumberController.text;
        // Update the profile document
        firestore.collection('profile').doc(userId).update({
          'name': name,
          'email':email,
          'password': password,
          'emergencyContact1': emergencyContact1,
          'emergencyContact2': emergencyContact2,
          'emergencyContact3': emergencyContact3,
          'mobile': mobilenumber,

          // Add additional fields here if needed
        }).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile updated successfully'),
            ),
          );
        }).catchError((error) {
          print('Failed to update profile: $error');
        });
      } else {
        // No document with the provided email found
        print('No document found with the provided email');
      }
    }).catchError((error) {
      print('Error searching for document: $error');
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF90CAF9),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emergencyContact1Controller,
                decoration: InputDecoration(
                  labelText: 'Emergency Contact 1',
                ),
                validator: _validateEmergencyContact,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emergencyContact2Controller,
                decoration: InputDecoration(
                  labelText: 'Emergency Contact 2',
                ),
                validator: _validateEmergencyContact,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emergencyContact3Controller,
                decoration: InputDecoration(
                  labelText: 'Emergency Contact 3',
                ),
                validator: _validateEmergencyContact,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _mobilenumberController,
                decoration: InputDecoration(
                  labelText: 'Your Mobile number',
                ),
                validator: _validateEmergencyContact,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateProfile();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BottomPage(),
                          ),
                        );// Call function to update profile
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Update Profile'),
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
