import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FIR_form.dart';

class FIRRegistrationPage extends StatefulWidget {
  @override
  _FIRRegistrationPageState createState() => _FIRRegistrationPageState();
}

class _FIRRegistrationPageState extends State<FIRRegistrationPage> {
  List<String> _firDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'FIR Details'), // Custom title bar
            SizedBox(height: 10),
            Text(
              'FIR Details:',
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
              stream: FirebaseFirestore.instance.collection('fir').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final firs = snapshot.data?.docs.reversed.toList();
                  List<Widget> firwidgets = [];
                  for (var fir in firs!) {
                    firwidgets.add(
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('FIR ID: ${fir['FIR ID']}'),
                              Text('Victim Name: ${fir['Victim Name']}'),
                              Text('Victim Address: ${fir['Victim Address']}'),
                              Text('Complainant Name: ${fir['Complainant Name']}'),
                              Text('Complainant Contact: ${fir['Complainant Contact']}'),
                              Text('Relationship to Victim: ${fir['Relationship to Victim']}'),
                              Text('Incident Date: ${fir['Incident Date']}'),
                              Text('Incident Type: ${fir['Incident Type']}'),
                              Text('Incident Details: ${fir['Incident Details']}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView(
                      children: firwidgets,
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
                      builder: (context) => FIRFormPage(
                        onSubmit: (details) {
                          setState(() {
                            _firDetails.add(details);
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
                  'Create new FIR',
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
