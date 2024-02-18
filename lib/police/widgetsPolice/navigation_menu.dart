import 'package:crime_track_master/police/homepage.dart';
import 'package:crime_track_master/police/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../../citizen/emergency_contact.dart';
import '../../citizen/home_page.dart';
import '../settings.dart';
class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}
class _NavigationMenuState extends State<NavigationMenu> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        pageSnapping: false,
        children: <Widget>[
          HomePage(),
          ServicesPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Services',
            icon: Icon(FontAwesomeIcons.list),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
