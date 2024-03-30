// EmergencyService.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyService {
  static Future<void> sendEmergencySMS() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      String? loggedInUserEmail = auth.currentUser?.email;

      if (loggedInUserEmail == null) {
        print('User email is null, make sure the user is logged in and email is fetched.');
        return;
      }

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('profile')
          .where('email', isEqualTo: loggedInUserEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot docSnapshot = querySnapshot.docs.first;
        List<String> phoneNumbers = List<String>.from
          ([
           docSnapshot['emergencyContact1'],
           docSnapshot['emergencyContact2'],
           docSnapshot['emergencyContact3'],
        ]);

        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

        for (String phoneNumber in phoneNumbers) {
          String message = 'I need help. Here is my live location: $googleMapsUrl';
          String encodedMessage = Uri.encodeComponent(message);
          String url = 'sms:$phoneNumber?body=$encodedMessage';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }
      } else {
        print('No emergency contacts found for the logged-in user.');
      }
    } catch (e) {
      print('Error sending emergency SMS: $e');
    }
  }
}
