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
            Expanded(
              child: ListView.builder(
                itemCount: _caseDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFFECACB),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _caseDetails[index],
                        style: GoogleFonts.merriweather(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF620304),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
