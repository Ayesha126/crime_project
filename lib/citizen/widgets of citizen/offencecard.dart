import 'package:crime_track_master/citizen/services%20pages/report%20to%20us/fir.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FIRCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center( // Wrap with Center widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center align content vertically
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FIRPage()),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset(
                      'images/report.png',
                      height: 32,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8), // Add space between the image and text
            Text(
              "Report Offence",
              textAlign: TextAlign.center, // Center align text horizontally
            ),
          ],
        ),
      ),
    );
  }
}
