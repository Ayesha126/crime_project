import 'package:flutter/material.dart';
import 'package:crime_track_master/police/PolicePg/staffDetails.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffDisplayPage extends StatefulWidget {
  final List<String> staffDetails;

  StaffDisplayPage({required this.staffDetails});

  @override
  _StaffDisplayPageState createState() => _StaffDisplayPageState();
}

class _StaffDisplayPageState extends State<StaffDisplayPage> {
  @override
  Widget build(BuildContext context) {
    Color transparentColor = Color(0x7B0305); // Transparent color

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitleBar(title: 'Staff Details'), // Custom title bar
            SizedBox(height: 10),
            Text(
              'Staff Details:', // Changed from 'FIR Details'
              style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Background color of the title bar
                ),
              ),),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.staffDetails.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Color(0xFFFECACB),
                      elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.staffDetails[index],
                          style: GoogleFonts.merriweather( // Example of changing font to Open Sans
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF620304),// Background color of the title bar
                    ),
                    ),
                          textAlign: TextAlign.left,
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
                      builder: (context) => StaffDetailsPage(
                        onSubmit: (details) {
                          setState(() {
                            // Update the parent's state with the new details
                            widget.staffDetails.add(details);
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF7B0305)), // Change color here
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Add new Staff ',
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