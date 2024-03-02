import 'package:crime_track_master/police/settings.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:google_fonts/google_fonts.dart';

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
          SizedBox(height: 10),
          MiddleTitleBar(title: 'Services', height: 45),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/img.png', // Replace with your image icon asset path
                    height: 68, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                   Text(
                      'FIR Registration',
                    style: GoogleFonts.merriweather (
                      fontSize: 15, // Adjust the font size as needed
                      color: Colors.black,
                    )
                  ), // Example: Replace with your desired label
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the settings page when the settings icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'images/police.png', // Replace with your image icon asset path
                      height: 73, // Adjust the height as needed
                    ),
                SizedBox(height: 10),
                    Text('Staff Details',

                      style: GoogleFonts.merriweather (
                        fontSize: 15, // Adjust the font size as needed
                        color: Colors.black,
                    ), // Example: Replace with your desired label
                    ),],
                ),
              ),
              // Add more columns for other icons
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/archive.png', // Replace with your image icon asset path
                    height: 70, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Archive Files',
                      style: GoogleFonts.merriweather (
                        fontSize: 15, // Adjust the font size as needed
                        color: Colors.black,
                      )
                  ), // Example: Replace with your desired label
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the settings page when the settings icon is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      'images/setting.png', // Replace with your image icon asset path
                      height: 65, // Adjust the height as needed
                    ),
                    SizedBox(height: 10),
                    Text(' Settings  ',

                      style: GoogleFonts.merriweather (
                        fontSize: 15, // Adjust the font size as needed
                        color: Colors.black,
                      ), // Example: Replace with your desired label
                    ),],
                ),
              ),
              // Add more columns for other icons
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/next.png', // Replace with your image icon asset path
                    height: 65, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                  Text(
                      'View all',
                      style: GoogleFonts.merriweather (
                        fontSize: 15, // Adjust the font size as needed
                        color: Colors.black,
                      )
                  ), // Example: Replace with your desired label
                ],
              ),

              // Add more columns for other icons
            ],
          ),
        ], // Close children of the Column widget
      ), // Close Column widget
    ); // Close Scaffold widget
  }
}

