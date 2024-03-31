
import 'package:crime_track_master/citizen/emergency_contact.dart';
import 'package:crime_track_master/citizen/home_page.dart';
import 'package:crime_track_master/citizen/navigation_bar.dart';
import 'package:crime_track_master/citizen/services%20pages/information%20services/internet.dart';
import 'package:crime_track_master/citizen/services.dart';
import 'package:crime_track_master/police/PolicePg/homepage.dart';
import 'package:crime_track_master/police/widgetsPolice/navigation_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:crime_track_master/Pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC_tNcqUtzkWdk717l1rBN7msMdK7OOx2c",
        appId: "1:902918202021:android:abcc43470cfb497d7d634c",
        messagingSenderId: "902918202021",
        projectId: "crime-track-master"
    ),
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:LoginPage(),
    );
  }
}


