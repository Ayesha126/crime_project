import 'package:flutter/material.dart';

import 'database.dart';
import 'modelclass.dart';
 // Update this import

class UserDataProvider with ChangeNotifier {
  List<UserData> _userData = [];
  final String userEmail;

  UserDataProvider(this.userEmail) {
    _loadUserData();
  }

  List<UserData> get userData => _userData;

  Future<void> _loadUserData() async {
    _userData = await DatabaseService(userEmail).fetchUserData();
    notifyListeners();
  }
}
