import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FIRPage extends StatefulWidget {

  @override
  _FIRPageState createState() => _FIRPageState();
}

class _FIRPageState extends State<FIRPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _phonenumber = TextEditingController();
  final _EmergencyContact = TextEditingController();
  final _Relation = TextEditingController();
  final _EmergencyContact1 = TextEditingController();
  final _Relation1 = TextEditingController();
  final _EmergencyContact2 = TextEditingController();
  final _Relation2 = TextEditingController();
  final _email = TextEditingController();
  final _Password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xFF90CAF9), // Change primary color to red
        inputDecorationTheme:  InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF90CAF9)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelStyle: TextStyle(
            color: Colors.blueGrey, // Change label color
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF90CAF9),
          title: Text('FIR Form',
            style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8F8F8)
            ),
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add horizontal padding
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _name,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },



                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _address ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Address',
                      prefixIcon: Icon(Icons.dehaze_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Address';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _phonenumber,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      prefixIcon: Icon(Icons.person), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Mobile Number';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_email ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(FontAwesomeIcons.squarePhone), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _EmergencyContact,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Emergency Number',
                      prefixIcon: Icon(Icons.people), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Emergency Mobile Number';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _Relation,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Relation to Emergency Contact',
                      prefixIcon: Icon(Icons.date_range), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Relation to Emergency Contact';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _EmergencyContact1,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Emergency Mobile Number',
                      prefixIcon: Icon(Icons.menu_open_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Emergency Mobile Number';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_Relation1 ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Relation to Emergency Contact',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey, // Change the color here
                      ),
                      prefixIcon: Icon(Icons.description), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Emergency Mobile Number';
                      }
                      return null;
                    },
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _EmergencyContact2,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Emergency Mobile Number',
                      prefixIcon: Icon(Icons.menu_open_outlined), // Add icon on the left side
                    ),

                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_Relation2 ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Relation to Emergency Contact',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey, // Change the color here
                      ),
                      prefixIcon: Icon(Icons.description), // Add icon on the left side
                    ),
                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _Password,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.menu_open_outlined), // Add icon on the left side
                    ),

                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate the form before submission
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        CollectionReference collref = FirebaseFirestore.instance.collection('profile');
                        collref.add({
                          'Name': _name.text,
                          'Address': _address.text,
                          'Phone Number': _phonenumber.text,
                          'Email': _email.text,
                          'Emergency Contact': _EmergencyContact.text,
                          'Relation to Emergency Contact': _Relation.text,
                          'Emergency Contact1': _EmergencyContact1.text,
                          'Relation to Emergency Contact1': _Relation1.text,
                          'Emergency Contact2': _EmergencyContact2.text,
                          'Relation to Emergency Contact2': _Relation2.text,
                          'Password': _Password.text,

                        });// Save form data
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF90CAF9)), // Change color here
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send), // Add icon on the left side
                        SizedBox(width: 8),
                        Text('Edit Profile'),
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

//onChanged: (value) {
//setState(() {
//_incidentDetails = value;
//});
//},