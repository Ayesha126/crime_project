  import 'package:crime_track_master/police/homepage.dart';
  import 'package:crime_track_master/police/services.dart';
  import 'package:crime_track_master/police/settings.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:flutter/material.dart';

  class NavigationMenu extends StatefulWidget {
    const NavigationMenu({super.key});
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
          pageSnapping: true,
          physics: const NeverScrollableScrollPhysics(),
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
              curve: Curves.ease ,
            );
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7B0305),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(FontAwesomeIcons.house),
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
