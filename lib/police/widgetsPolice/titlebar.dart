import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MiddleTitleBar extends StatelessWidget {
  final String title;
  final double height;

  const MiddleTitleBar({
    Key? key,
    required this.title,
    this.height = 50, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8, // Add padding to account for status bar and additional padding
        bottom: 10, // Increase the bottom padding to increase the height
        left: 16,
        right: 16,
      ),
      height: height,
      // Set the height of the title bar
      color: Colors.red.withOpacity(0.2),
      // Example color for the title bar
    child: Text(
    title,
    style: GoogleFonts.merriweather( // Example of changing font to Open Sans
    textStyle: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.red,
    ),
        ),
      ),
    );
  }
}

class CustomTitleBar extends StatelessWidget {
  final String title;
  const CustomTitleBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double customTitleBarHeight = 90.0;
    return Container(
        height: customTitleBarHeight,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top, // Add padding to account for status bar// Increase the bottom padding to increase the height
      ),
      color: Colors.red, // Background color of the title bar
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.merriweather( // Example of changing font to Open Sans
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        ),
      ),
    ),
    );
  }
}
