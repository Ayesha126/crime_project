import 'package:crime_track_master/citizen/emergency_contact.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex=0;
  List<Widget> pages=[
    ContactPage(),
    HomeScreen(),
  ];
  onTapped(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'services',
            icon: Icon(Icons.border_all),
          ),
          BottomNavigationBarItem(
            label: 'contacts',
            icon: Icon(Icons.contacts),
          ),

          BottomNavigationBarItem(
            label: 'setting',
            icon: Icon(Icons.settings),
          ),
        ],),
    );
  }
}