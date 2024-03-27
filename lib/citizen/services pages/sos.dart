import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendDistressMessageToFirestore(String email, String loggedInUserEmail) async {
  try {
    // Convert the email to lowercase for consistency
    String lowercaseUserEmail = loggedInUserEmail.toLowerCase();

    // Query Firestore to find the document ID associated with the provided email
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('profile')
        .where('email'.toLowerCase(), isEqualTo:lowercaseUserEmail) // Convert email to lowercase before comparison
        .get();

    // Check if the query result is not empty
    if (querySnapshot.docs.isNotEmpty) {
      // Retrieve the document ID
      String documentId = querySnapshot.docs.first.id;

      // Get document snapshot from Firestore using the retrieved document ID
      DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('profile').doc(documentId).get();

      // Check if document exists
      if (snapshot.exists) {
        // Retrieve emergency numbers from Firestore document
        List<String> phoneNumbers = [];
        phoneNumbers.add(snapshot['emergencyContact1']);
        phoneNumbers.add(snapshot['emergencyContact2']);
        phoneNumbers.add(snapshot['emergencyContact3']);

        // Request location permission
        var status = await Permission.location.request();
        if (status == PermissionStatus.granted) {
          // Get current position
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );

          // Construct message with current location and Google Maps link
          String latitude = position.latitude.toString();
          String longitude = position.longitude.toString();
          String message =
              'I am in distress! My current location is: $latitude, $longitude';

          String googleMapsUrl =
              'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
          message += '\n\nOpen in Google Maps: $googleMapsUrl';

          // Encode message for URL
          String encodedMessage = Uri.encodeComponent(message);

          // Construct SMS URL
          String url = 'sms:${phoneNumbers.join(';')}?body=$encodedMessage';

          // Launch SMS app
          await launch(url);
        } else {
          print("Location permission denied");
        }
      } else {
        print('Document does not exist');
      }
    } else {
      print('No document found for the provided email');
    }
  } catch (e) {
    print('Error sending distress message: $e');
  }
}
