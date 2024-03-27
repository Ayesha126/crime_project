import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crime_track_master/citizen/services pages/report to us/anonymously.dart';
import 'package:crime_track_master/citizen/services pages/report to us/cyber.dart';
import 'package:crime_track_master/citizen/services pages/report to us/fir.dart';
import 'package:crime_track_master/citizen/services pages/information services/cybersecurity.dart';
import 'package:crime_track_master/citizen/services pages/information services/internet.dart';
import 'package:crime_track_master/citizen/services pages/sos.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ... rest of the code remains unchanged


class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final TextEditingController _searchController = TextEditingController();


  static Future<void> openMap(String location) async{
    String googleUrl='https://www.google.co.in/maps/search/$location';
    final Uri _url=Uri.parse(googleUrl);
    try{
      await launchUrl(_url);
    }catch(e){
      Fluttertoast.showToast(msg: 'Something went wrong! Call emergency number 112');
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

                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          sendDistressMessageToFirestore('dEmZjHkH2yb5CLUq04Cy');
                        },
                        child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('images/sos.png', scale: 7.0),
                      ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrackTrip()),
                          );
                          },
                      child:Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('images/report.png', scale: 6.0),
                      ),
                      ),

                      const SizedBox(height: 10), // add some space between the image and the text
                      const Center(
                        child: Text('Track My Trip'),
                      ),
                    ],
                  ),
                  Column(
                    children: [

                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          openMap('Police station near me');
                        },
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('images/police station.png', scale: 6.0),
                        ),
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
                      GestureDetector(
                        onTap: () {
                          openMap('hospitals near me');
                        },
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('images/hospital.png', scale: 6.0),
                        ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cyber()),
                          );
                        },
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('images/hacking.png', scale: 6.0),
                        ),
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
                      GestureDetector(
                        onTap: () {
                          launch('https://www.youtube.com/results?search_query=self+defence+training');
                        },
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset('images/fight.png', scale: 6.0),
                        ),
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
                          child: Image.asset('images/cyber security.png', scale: 8.0),
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
  Future<void> _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

}




class HospitalStation extends StatelessWidget {
  final Function onMapFunction;

  const HospitalStation({Key? key, required this.onMapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onMapFunction('hospitals near me');
        },
        child: Column(
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                onMapFunction('hospitals near me');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('images/hospital.png', scale: 6.0),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('Find Hospital'),
            ),
          ],
        ),
      ),
    );
  }
}

class PoliceStation extends StatelessWidget {
  final Function onMapFunction;

  const PoliceStation({Key? key, required this.onMapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          onMapFunction('police stations near me');
        },
      ),
    );
  }
}
// Function to open WhatsApp with live location



class TrackTrip extends StatefulWidget {
  @override
  _TrackTripState createState() => _TrackTripState();
}

class _TrackTripState extends State<TrackTrip> {
  late GoogleMapController mapController;
  late Position _currentPosition;
  late StreamSubscription<Position> _positionStreamSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Trip'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 15.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    super.dispose();
    _positionStreamSubscription.cancel();
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print(e);
    }
  }

  void _startLocationUpdates() {
    _positionStreamSubscription = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10, // in meters
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
        _updateFirestoreWithLocation(position);
      });
    });
  }

  void _updateFirestoreWithLocation(Position position) async {
    // Retrieve phone numbers from Firestore
    List<String> phoneNumbers = await _getEmergencyNumbersFromFirestore();

    // Construct Google Maps URL with current live location
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

    // Send location update via SMS to each phone number
    for (String phoneNumber in phoneNumbers) {
      String message = 'Live location update: $googleMapsUrl';
      String encodedMessage = Uri.encodeComponent(message);
      String url = 'sms:$phoneNumber?body=$encodedMessage';
      await launch(url);
    }
  }

  Future<List<String>> _getEmergencyNumbersFromFirestore() async {
    try {
      // Retrieve emergency numbers from Firestore
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('profile').doc('dEmZjHkH2yb5CLUq04Cy').get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<String> emergencyNumbers = [
        data['emergencyContact1'],
        data['emergencyContact2'],
        data['emergencyContact3'],
      ];
      return emergencyNumbers;
    } catch (e) {
      print('Error retrieving emergency numbers: $e');
      return []; // Return an empty list or handle the error as per your requirement
    }
  }
}


