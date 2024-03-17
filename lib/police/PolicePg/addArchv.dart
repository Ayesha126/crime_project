import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';
class AddArchiveFilesPage extends StatefulWidget {
  @override
  _AddArchiveFilesPageState createState() => _AddArchiveFilesPageState();
}
class _AddArchiveFilesPageState extends State<AddArchiveFilesPage> {
  final _formKey = GlobalKey<FormState>();

  String? _caseID;
  String? _description;
  String? _status;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
        textTheme: GoogleFonts.merriweatherTextTheme(),// Apply Google Font to the text theme
          primaryColor: Color(0xFF7B0305), // Change primary color to red
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B0305)),
              borderRadius: BorderRadius.circular(32.0),
            ),
            labelStyle: TextStyle(
              color: Colors.black, // Change label color
            ),
          ),
        ),
    child: Scaffold(
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTitleBar(title: ' Add to Archive Files'), // Custom title bar
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Case ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Case ID';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _caseID = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Color(0xFF7B0305),
                  decoration: InputDecoration(
                    labelText: 'Status',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Status';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _status = value;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Now you can process the data
                      // Navigate back to the ArchiveFilesPage and pass the data as arguments
                      Navigator.pop(context, {
                        'caseID': _caseID,
                        'description': _description,
                        'status': _status,
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add), // Add icon on the left side
                      SizedBox(width: 8),
                      Text('Add to archive files'),
                    ],
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
