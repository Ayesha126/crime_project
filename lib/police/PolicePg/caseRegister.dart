import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';

class CaseRegistrationPage extends StatefulWidget {
  final Function(String) onSubmit; // Function to handle submission

  const CaseRegistrationPage({Key? key, required this.onSubmit}) : super(key: key);
  @override
  _CaseRegistrationPageState createState() => _CaseRegistrationPageState();
}

class _CaseRegistrationPageState extends State<CaseRegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  // Define variables to store case registration details
  final _incidentDetails = TextEditingController();
  final _location = TextEditingController();
  DateTime? _dateTime;
  final _caseType = TextEditingController();
  final _witnessInformation = TextEditingController();
  final _evidence = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color(0xFF7B0305), // Change primary color to red
        inputDecorationTheme: InputDecorationTheme(
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
      child: Scaffold(
        body: SingleChildScrollView(
    child: Form(
    key: _formKey, // Assign form key
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
              CustomTitleBar(title: 'Case Registration'),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Color(0xFF7B0305),
                  controller:_incidentDetails ,
                  decoration: InputDecoration(
                    labelText: 'Incident Details',
                    prefixIcon: Icon(Icons.description), // Prefix icon
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
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Color(0xFF7B0305),
                  controller: _location,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    prefixIcon: Icon(Icons.location_on), // Prefix icon
                  ),
                        validator: (value) {
                    if (value == null || value.isEmpty) {
                    return 'Please enter location';
                    }
                    return null;
                    },

    ),
    ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () async {
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
                  child: AbsorbPointer(
                    child: TextFormField(
                      cursorColor: Color(0xFF7B0305),
                      decoration: InputDecoration(
                        labelText: 'Date',
                        prefixIcon: Icon(Icons.calendar_today_outlined), // Prefix icon
                      ),
                      controller: TextEditingController(
                        text: _dateTime != null
                            ? '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}'
                            : '',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _caseType,
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Case Type',
                    prefixIcon: Icon(Icons.folder), // Prefix icon
                  ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter case type';
    }
    return null;
    },

    ),
    ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _witnessInformation,
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Witness Information',
                    prefixIcon: Icon(Icons.person), // Prefix icon
                  ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter witness information';
    }
    return null;
    },
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _evidence,
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Evidence',
                    prefixIcon: Icon(Icons.insert_drive_file_outlined), // Prefix icon
                  ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter evidence details';
    }
    return null;
    },

                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      CollectionReference collref = FirebaseFirestore.instance.collection('casereg');
                      collref.add({
                        'Incident Details': _incidentDetails.text,
                        'Location': _location.text,
                        'Date and Time': _dateTime != null
                            ? '${_dateTime!.day}/${_dateTime!.month}/${_dateTime!.year}'
                            : '', // Corrected string concatenation
                        'Case Type': _caseType.text, // Corrected string concatenation
                        'Witness Information': _witnessInformation.text, // Added .text property
                        'Evidence': _evidence.text,
                      });
                      Navigator.pop(context);
                    }
                  },

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.send), // Add icon on the left side
    SizedBox(width: 8),
    Text('Register Case'),
    ],
    ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
