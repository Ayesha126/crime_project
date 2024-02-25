import 'package:crime_track_master/police/settings.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleBar(title: 'Home Page'), // Custom title bar
          Container(
            height: 200, // Adjust the height as needed
            color: Colors.grey[300], // Background color of the image container
            child: Center(
              child: Image.asset(
                'images/logo.png', // Replace 'your_image.png' with your image asset path
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
          ),
          SizedBox(height: 20),
          // Add spacing between the image and icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/logo.png', // Replace with your image icon asset path
                    height: 24, // Adjust the height as needed
                  ),
                  Text('Home'), // Example: Replace with your desired label
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
                      'images/logo.png', // Replace with your image icon asset path
                      height: 24, // Adjust the height as needed
                    ),
                    Text('Settings'), // Example: Replace with your desired label
                  ],
                ),
              ),
              // Add more columns for other icons
            ],
          ),
        ],
      ),
    );
  }
}
