import 'package:crime_track_master/citizen/services%20pages/report%20to%20us/anonymously.dart';
import 'package:crime_track_master/citizen/services%20pages/report%20to%20us/fir.dart';
import 'package:crime_track_master/citizen/services%20pages/information%20services/cybersecurity.dart';
import 'package:crime_track_master/citizen/services%20pages/information%20services/internet.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/PoliceStationCard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final TextEditingController _searchController = TextEditingController();
  Future<void> _openMap(double latitude, double longitude, String title) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude($title)';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF90CAF9),
        title: const Text('Services',
        style:TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFFF8F8F8)
        ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
        body: SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 8.0, top: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search for services...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(
                    left: 16.0, top: 8.0, bottom: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFCC99),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Emergency Contacts",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFCC6600),
                    ),
                  ),
                ),

              ),
            ],
          ),
           // 10 logical pixels of space
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFFFCC99), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/sos.png', scale: 7.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('SOS'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        launch('tel:112');
                      },
                    child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/emergency-phone.png', scale: 8.4),
                    ),
                        ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('All India Emergency'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFF66FFFF),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Citizen Safety Services",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1565C0),
                    ),
                  ),
                ),

              ),
            ],
          ),
          // 10 logical pixels of space
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF66FFFF), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/report.png', scale: 6.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Report Offence'),
                    ),
                  ],
                ),
                Column(
                  children: [

                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/police station.png', scale: 6.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Find police Station'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/hospital.png', scale: 6.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Find Hospital'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCC99FF),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Report To Us",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF990099),
                    ),
                  ),
                ),

              ),
            ],
          ),
          // 10 logical pixels of space
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFCC99FF), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FIRPage()),
                );
              },
                    child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/report.png', scale: 6.0),
                    ),
            ),
                     const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Report Offence'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/hacking.png', scale: 6.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Report Cyber fraud'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Anonymously()),
                        );
                      },
                    child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/suspect.png', scale: 8.0),
                    ),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Share information Anonymously'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10), // add padding to the left side
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: const  Color(0xFF99FFCC),
                    borderRadius: BorderRadius.circular(10), // make the border circular
                  ),
                  child: Text(
                    "Information Services",
                    style: GoogleFonts.laila(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF009900),
                    ),
                  ),
                ),

              ),
            ],
          ),
          // 10 logical pixels of space
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF99FFCC), // Change this to the color you want
                width: 1, // Change this to the width you want
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),

            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/fight.png', scale: 6.0),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Self Defence Videos'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CyberPage()),
                        );
                      },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/cyber security.png', scale: 6.0),
                    ),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Cyber Security Information'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InternetPage()),
                        );
                      },
                    child:Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('images/internet tips.png', scale: 6.0),
                    ),
                    ),
                    const SizedBox(height: 10), // add some space between the image and the text
                    const Center(
                      child: Text('Internet Tips'),
                    ),
                  ],
                ),
              ],
            ),
          ),


        ],
      ),
    ),
    );
  }
}