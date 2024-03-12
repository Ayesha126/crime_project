import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendDistressMessage(List<String> phoneNumbers) async {
  Position position;

  var status = await Permission.location.request();
  if (status == PermissionStatus.granted) {
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print("Error getting location: $e");
      return;
    }
  } else {
    print("Location permission denied");
    return;
  }

  String message = 'I am in distress! My current location is: ${position.latitude}, ${position.longitude}';
  String url = 'sms:${phoneNumbers.join(';')}?body=$message';
  await launch(url);
}
