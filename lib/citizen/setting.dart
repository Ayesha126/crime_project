import 'package:crime_track_master/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    body: Center(
      child: ElevatedButton(onPressed: (){
        FirebaseAuth.instance.signOut().then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        });
      }, child: Text("LogOut")),
    ),
    );
}
}