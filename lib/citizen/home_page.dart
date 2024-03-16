import 'package:crime_track_master/citizen/widgets%20of%20citizen/CustomCaroule.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/Customapp_bar.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/PoliceStationCard.dart';
import 'package:crime_track_master/citizen/widgets%20of%20citizen/livesafe.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission_handler package

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission(); // Check location permission when the screen initializes
  }

  Future<void> _checkLocationPermission() async {
    // Check if location permission is granted
    PermissionStatus status = await Permission.location.status;
    if (status != PermissionStatus.granted) {
      // If not granted, request permission
      await Permission.location.request();
    }

    // After permission is granted, get current location
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable location services.');
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request location permissions
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied.');
        return;
      }
    }

    // If permissions are permanently denied, inform the user
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg: 'Location permissions are permanently denied.');
      return;
    }

    // Fetch current position if permissions granted
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppBar(),
    body: SafeArea(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCaroule(),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF90CAF9), // White interior
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your current location is',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1565C0),
                            ),
                          ),
                          SizedBox(height: 10),
                          FutureBuilder(
                            future: Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high),
                            builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
                              if (snapshot.hasData) {
                                return Text('Latitude: ${snapshot.data?.latitude}, Longitude: ${snapshot.data?.longitude}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1565C0),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color(0xFF90CAF9),
                      child: Text(
                        "Services",
                        style: GoogleFonts.laila(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1565C0),
                        ),
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
