import 'package:cloud_firestore/cloud_firestore.dart';
import 'modelclass.dart';

class DatabaseService {
  final String userEmail;

  DatabaseService(this.userEmail);

  Future<List<UserData>> fetchUserData() async {
    List<UserData> userDataList = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('profile')
          .where('email', isEqualTo: userEmail)
          .get();

      for (var doc in querySnapshot.docs) {
        userDataList.add(UserData.fromFirestore(doc));
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return userDataList;
  }
}
