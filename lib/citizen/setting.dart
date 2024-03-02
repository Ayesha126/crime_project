import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Setting"), // Custom title bar
        Expanded(
          child: Center(
            child: Text(
              'Welcome to the Settings Screen!',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    ),
  );
}
}