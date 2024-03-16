import 'package:crime_track_master/police/PolicePg/FIR_Registration.dart';
import 'package:crime_track_master/police/PolicePg/services.dart';
import 'package:crime_track_master/police/PolicePg/settings.dart';
import 'package:crime_track_master/police/PolicePg/staffDetails.dart';
import 'package:crime_track_master/police/PolicePg/staffDisplay.dart';
import 'package:crime_track_master/police/widgetsPolice/passwordbtn.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'caseDisplay.dart';
import 'caseRegister.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomTitleBar(title: 'Home Page'), // Custom title bar
          Container(
            height: 200, // Adjust the height as needed
            color: Colors.grey[300], // Background color of the image container
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'images/img2.webp', // Replace 'your_image.png' with your image asset path
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 0,
                  right: 170,
                  top: 60,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      color: Colors.transparent, // Background color of the text container
                      child: Text(
                        'SURAT '
                            'POLICE', // Add your text here
                        style: GoogleFonts.merriweather(
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          MiddleTitleBar(title: 'Services', height: 45),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0,  bottom: 8.0,right:8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFFF2400), // Background color of the title bar
                  width:1.5, // Adjust the border width as needed
                ),
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the services page when the image is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FIRRegistrationPage()),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Image.asset(
                              'images/fir.png', // Replace with your image icon asset path
                              height: 69, // Adjust the height as needed
                            ),
                            SizedBox(height: 10),
                            Text(
                              'FIR Registration',
                              style: GoogleFonts.merriweather(
                                fontSize: 15, // Adjust the font size as needed
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsButton(onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => StaffDisplayPage(staffDetails: [],),
                                  ),
                                );
                              },),

                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            Image.asset(
                              'images/police.png', // Replace with your image icon asset path
                              height: 71, // Adjust the height as needed
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Staff Details',
                              style: GoogleFonts.merriweather(
                                fontSize: 15, // Adjust the font size as needed
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CaseDisplayPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'images/case.png',
                              height: 72,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Case Registartion',
                              style: GoogleFonts.merriweather(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'images/archive.png',
                              height: 85,
                            ),

                            Text(
                              'Archive Files',
                              style: GoogleFonts.merriweather(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to the services page when the image is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ServicesPage()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'images/wanted.png', // Replace with your image icon asset path
                              height: 75, // Adjust the height as needed
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Wanted List',
                              style: GoogleFonts.merriweather(
                                fontSize: 15, // Adjust the font size as needed
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ], // Close children of the Column widget
      ), // Close Column widget
    ); // Close Scaffold widget
  }
}

