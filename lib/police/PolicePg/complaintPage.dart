import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';

class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleBar(title: 'Complaint Page'), // Custom title bar
          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Complaint Page',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
