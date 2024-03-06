import 'package:flutter/material.dart';

import '../widgetsPolice/titlebar.dart';
class StaffDetailsPage extends StatefulWidget {
  final Function(String) onSubmit;
  StaffDetailsPage({required this.onSubmit});

  @override
  _StaffDetailsPageState createState() => _StaffDetailsPageState();
}

class _StaffDetailsPageState extends State<StaffDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  String _staffName = '';
  String _staffEmail = '';
  String _staffPhoneNumber = '';
  String _staffPosition = '';
  String _staffDepartment = '';
  String _staffId = '';

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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ CustomTitleBar(title: 'Staff Form:'),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff Name',
                      prefixIcon: Icon(Icons.person), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffName = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff Email',
                      prefixIcon: Icon(Icons.email), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffEmail = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff Phone Number',
                      prefixIcon: Icon(Icons.phone), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff phone number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffPhoneNumber = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff Position',
                      prefixIcon: Icon(Icons.work), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff position';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffPosition = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff Department',
                      prefixIcon: Icon(Icons.business), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff department';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffDepartment = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    cursorColor: Color(0xFF7B0305),
                    decoration: InputDecoration(
                      labelText: 'Staff ID',
                      prefixIcon: Icon(Icons.perm_identity_sharp), // Add icon on the left side
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter staff ID';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _staffId = value;
                      });
                    },
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
                            'Staff Name: $_staffName\n'
                            'Staff Email: $_staffEmail\n'
                            'Staff Phone Number: $_staffPhoneNumber\n'
                            'Staff Position: $_staffPosition\n'
                            'Staff Department: $_staffDepartment\n'
                            'Staff ID: $_staffId';
                        widget.onSubmit(details);
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
                        Text('Submit Staff Details'),
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
