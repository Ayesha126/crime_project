import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Anonymously extends StatefulWidget {

  @override
  _AnonymouslyState createState() => _AnonymouslyState();
}

class _AnonymouslyState extends State<Anonymously> {
  final _formKey = GlobalKey<FormState>();
  final _offencecategory = TextEditingController();
  final _policedistrict = TextEditingController();
  final _policestation = TextEditingController();
  final _placeoccurence = TextEditingController();
  final _offencedescription = TextEditingController();

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
          title: Text('Share Information Anonymously',
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
                    controller: _offencecategory,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Offence Category',
                      prefixIcon: Icon(Icons.car_crash_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Offence Category';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _policedistrict,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Police District',
                      prefixIcon: Icon(Icons.device_hub_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Police District';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _policestation,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Police Station',
                      prefixIcon: Icon(Icons.local_police), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Police Station';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_placeoccurence ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Place of Occurence',
                      prefixIcon: Icon(Icons.house_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Place of Occurence';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _offencedescription,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Offence Description',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey, // Change the color here
                      ),
                      prefixIcon: Icon(Icons.description), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Offence Description';
                      }
                      return null;
                    },


                    maxLines: 5,
                  ),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate the form before submission
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // Save form data
                        CollectionReference collref = FirebaseFirestore.instance.collection('anonymouslyfir');
                        collref.add({
                          'Offence category': _offencecategory.text,
                          'Police District': _policedistrict.text,
                          'Police Station': _policestation.text,
                          'Place of Occurence': _placeoccurence .text,
                          'Offence description':_offencedescription.text,
                        });

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
                        Text('Submit FIR'),
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
//_policedistrict = value;
//});
//},