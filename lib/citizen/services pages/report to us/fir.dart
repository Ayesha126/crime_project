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
  final _victimaddress = TextEditingController();
  final _victimName = TextEditingController();
  final _complainantName = TextEditingController();
  final _complainantContact = TextEditingController();
  final _relationshipToVictim = TextEditingController();
  final _incidentDate = TextEditingController();
  final _incidentType = TextEditingController();
  final _incidentDetails = TextEditingController();

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
                    controller: _victimName,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Victim Name',
                      prefixIcon: Icon(Icons.person), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Victim name';
                      }
                      return null;
                    },



                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _victimaddress ,
                    cursorColor: Color(0xFF90CAF9),
                    decoration: InputDecoration(
                      labelText: 'Victim Address',
                      prefixIcon: Icon(Icons.dehaze_outlined), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Victim Address';
                      }
                      return null;
                    },


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _complainantName,
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


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_complainantContact ,
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


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _relationshipToVictim,
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


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _incidentDate,
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


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:  _incidentType,
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


                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller:_incidentDetails ,
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
                        _formKey.currentState!.save();
                        CollectionReference collref = FirebaseFirestore.instance.collection('offence');
                        collref.add({
                        'Victim Name': _victimName.text,
                        'Victim Address': _victimaddress.text,
                        'Complainant Name': _complainantName.text,
                        'Complainant Contact': _complainantContact.text,
                        'Relationship to Victim': _relationshipToVictim.text,
                        'Incident Date': _incidentDate.text,
                        'Incident Type': _incidentType.text,
                        'Incident Details': _incidentDetails.text,
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
//_incidentDetails = value;
//});
//},