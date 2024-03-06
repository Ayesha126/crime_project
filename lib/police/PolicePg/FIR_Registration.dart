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
              style: GoogleFonts.merriweather( // Example of changing font to Open Sans
            textStyle: const TextStyle(
            fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Background color of the title bar
            ),
      ),),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _firDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFFFECACB),
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _firDetails[index],
                  style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                  textStyle: const TextStyle(
                  fontSize: 14,
                    color: Color(0xFF620304),
                        ),
                      ),
                    ),
                  ));
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
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF7B0305)), // Change color here
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Create new FIR',
                    style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Background color of the title bar
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