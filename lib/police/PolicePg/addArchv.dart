import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';
class AddArchiveFilesPage extends StatefulWidget {
  final Function(String) onSubmit; // Function to handle submission

  const AddArchiveFilesPage({Key? key, required this.onSubmit}) : super(key: key);
  @override
  _AddArchiveFilesPageState createState() => _AddArchiveFilesPageState();
}
class _AddArchiveFilesPageState extends State<AddArchiveFilesPage> {
  final _formKey = GlobalKey<FormState>();
  final _caseID = TextEditingController();
  final _description = TextEditingController();
  final _status = TextEditingController();


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
                  controller: _caseID,
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


                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _description,
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


                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _status,
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


                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      CollectionReference collref = FirebaseFirestore.instance.collection('addarchive');
                      collref.add({
                        'Incident Details': _caseID.text,
                        'Location': _description.text,
                        'Case Type': _status.text, // Corrected string concatenation
                      });
                        Navigator.pop(context);
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
