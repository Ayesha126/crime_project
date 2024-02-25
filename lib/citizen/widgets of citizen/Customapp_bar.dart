import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF90CAF9),
      title: Text('Crime Track Master',
        style: GoogleFonts.lora(
          fontWeight: FontWeight.bold ,
          fontSize: 25,
          color: const Color(0xFF1565C0),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}