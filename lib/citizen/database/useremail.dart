import 'package:firebase_auth/firebase_auth.dart';

Future<String?> getUserEmail() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user != null) {
    // User is signed in
    return user.email;
  } else {
    // No user is signed in
    return null;
  }
}
