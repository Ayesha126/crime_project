import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String emergencyContact1;
  final String emergencyContact2;
  final String emergencyContact3;
  final String gender;
  final String mobile;
  final String name;
  final String password;
  // Add other fields as necessary

  UserData({
    required this.email,
    required this.emergencyContact1,
    required this.emergencyContact2,
    required this.emergencyContact3,
    required this.gender,
    required this.mobile,
    required this.name,
    required this.password,
  });

  factory UserData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return UserData(
      email: data['email'] ?? '',
      emergencyContact1: data['emergencyContact1'] ?? '',
      emergencyContact2: data['emergencyContact2'] ?? '',
      emergencyContact3: data['emergencyContact3'] ?? '',
      gender: data['gender'] ?? '',
      mobile: data['mobile'] ?? '',
      name: data['name'] ?? '',
      password: data['password'] ?? '',
    );
  }
}
