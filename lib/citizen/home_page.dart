import 'package:crime_track_master/citizen/widgets%20of%20citizen/CustomCaroule.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/Customapp_bar.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/livesafe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(),
    body: SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(child: ListView(
              shrinkWrap: true,
              children: [
                CustomCaroule(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xFF90CAF9),
                    child: Text("Services",
                      style: GoogleFonts.laila(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                      // This is the color code you want for the text
                    ),
                  ),
                ),
                LiveSafe(),
              ],
            ),
            ),
          ],
        ),
      ),
    ),
  );
}