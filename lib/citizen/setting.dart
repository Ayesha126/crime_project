import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFF90CAF9),
      title: Text('Setting',
        style:TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8F8F8)
        ),
      ),
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
    ),
    );
}
}