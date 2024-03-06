import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';

class CaseRegistrationPage extends StatefulWidget {
  @override
  _CaseRegistrationPageState createState() => _CaseRegistrationPageState();
}

class _CaseRegistrationPageState extends State<CaseRegistrationPage> {
  // Define variables to store case registration details
  String _incidentDetails = '';
  String _location = '';
  DateTime? _dateTime;
  String _caseType = '';
  String _witnessInformation = '';
  String _evidence = '';

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
        primaryColor: Color(0xFF7B0305), // Change primary color to red
    inputDecorationTheme:  InputDecorationTheme(
    border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF7B0305)),
    borderRadius: BorderRadius.circular(10.0),
    ),
    labelStyle: TextStyle(
    color: Colors.black, // Change label color
    ),
    ),
    ),
      child:Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTitleBar(title: 'Case Registration'),

            TextFormField(
              decoration: InputDecoration(labelText: 'Incident Details'),
              onChanged: (value) {
                setState(() {
                  _incidentDetails = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Location'),
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  setState(() {
                    _dateTime = selectedDate;
                  });
                }
              },
              child: Text(_dateTime != null
                  ? 'Date: ${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}'
                  : 'Select Date'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Case Type'),
              onChanged: (value) {
                setState(() {
                  _caseType = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Witness Information'),
              onChanged: (value) {
                setState(() {
                  _witnessInformation = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Evidence'),
              onChanged: (value) {
                setState(() {
                  _evidence = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Submit case registration details
                // You can use these variables (_incidentDetails, _location, etc.) to submit the details
                // For demonstration purposes, we'll print the details to the console
                print('Incident Details: $_incidentDetails');
                print('Location: $_location');
                print('Date and Time: ${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}');
                print('Case Type: $_caseType');
                print('Witness Information: $_witnessInformation');
                print('Evidence: $_evidence');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    ));
  }
}
