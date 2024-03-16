import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'caseRegister.dart';

class CaseDisplayPage extends StatefulWidget {
  @override
  _CaseDisplayPageState createState() => _CaseDisplayPageState();
}

class _CaseDisplayPageState extends State<CaseDisplayPage> {
  List<String> _caseDetails = []; // List to hold case details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTitleBar(title: 'Case Details'), // Custom title bar
            SizedBox(height: 10),
            Text(
              'Case Details:',
              style: GoogleFonts.merriweather(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('casereg').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final firs = snapshot.data?.docs.reversed.toList();
                List<Widget> staffwidgets = [];
                for (var casereg in firs!) {
                  staffwidgets.add(
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Case Type: ${casereg['Case Type']}'),
                            Text('Date and Time:${casereg['Date and Time']}'),
                            Text('Evidence:${casereg['Evidence']}'),
                            Text('Incident Details:${casereg['Incident Details']}'),
                            Text('Location:${casereg['Location']}'),
                            Text('Witness Information:${casereg['Witness Information']}'),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView(
                    children: staffwidgets,
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CaseRegistrationPage( // Navigate to case form page
                        onSubmit: (details) {
                          setState(() {
                            _caseDetails.add(details); // Add submitted case details to the list
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Create new Case',
                  style: GoogleFonts.merriweather(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
