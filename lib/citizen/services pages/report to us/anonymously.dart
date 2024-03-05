import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Anonymously extends StatefulWidget {

  @override
  _AnonymouslyState createState() => _AnonymouslyState();
}

class _AnonymouslyState extends State<Anonymously> {
  final _formKey = GlobalKey<FormState>();
  String _offencecategory = '';
  String _policedistrict = '';
  String _policestation = '';
  String _placeoccurence = '';
  String _offencedescription = '';

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
                    onChanged: (value) {
                      setState(() {
                        _offencecategory = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        _policedistrict = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        _policestation = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        _placeoccurence = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
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
                    onChanged: (value) {
                      setState(() {
                        _offencedescription = value;
                      });
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
                        String details =
                            'Offence Category: $_offencecategory\n'
                            'Police District: $_policedistrict\n'
                            'Police Station: $_policestation\n'
                            'Place of Occurence: $_placeoccurence\n'
                            'Offence Description: $_offencedescription';
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
