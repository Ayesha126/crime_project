import 'package:flutter/material.dart';
class CustomTitleBar extends StatelessWidget {
  final String title;
  const CustomTitleBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final double customTitleBarHeight = 90.0;

    return Container(
        height: customTitleBarHeight,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top, // Add padding to account for status bar// Increase the bottom padding to increase the height
      ),
      color: Colors.red, // Background color of the title bar
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
