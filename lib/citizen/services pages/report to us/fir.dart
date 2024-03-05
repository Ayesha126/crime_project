import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FIRPage extends StatefulWidget {

  @override
  _FIRPageState createState() => _FIRPageState();
}

class _FIRPageState extends State<FIRPage> {
  final _formKey = GlobalKey<FormState>();
  String _complainantName = '';
  String _complainantContact = '';
  String _relationshipToVictim = '';
  String _incidentDate = '';
  String _incidentType = '';
  String _incidentDetails = '';

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
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Complainant Name',
                      prefixIcon: Icon(Icons.person), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter complainant name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _complainantName = value;
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
                      labelText: 'Complainant Contact',
                      prefixIcon: Icon(FontAwesomeIcons.squarePhone), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter complainant contact';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _complainantContact = value;
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
                      labelText: 'Relationship to Victim (if any)',
                      prefixIcon: Icon(Icons.people), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter relationship to victim';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _relationshipToVictim = value;
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
                      labelText: 'Incident Date',
                      prefixIcon: Icon(Icons.date_range), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter incident date';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _incidentDate = value;
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
                      labelText: 'Incident Type',
                      prefixIcon: Icon(Icons.menu_open_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter incident type';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _incidentType = value;
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
                      labelText: 'Incident Details',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey, // Change the color here
                      ),
                      prefixIcon: Icon(Icons.description), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter incident details';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _incidentDetails = value;
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
                            'Complainant Name: $_complainantName\n'
                            'Complainant Contact: $_complainantContact\n'
                            'Relationship to Victim: $_relationshipToVictim\n'
                            'Incident Date: $_incidentDate\n'
                            'Incident Type: $_incidentType\n'
                            'Incident Details: $_incidentDetails';
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
