import 'package:crime_track_master/police/widgetsPolice/titlebar.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        CustomTitleBar(title: 'Services'), // Custom title bar
    Expanded(
    child: Center(
        child: Text(
          'This is the Services Page!',
          style: TextStyle(fontSize: 24),
        ),
    ),
    ),
        ],
        ),
    );
  }
}