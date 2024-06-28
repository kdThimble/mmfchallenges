import 'package:flutter/material.dart';
import 'package:meetmefitchallenges/models/user.dart';
import 'package:meetmefitchallenges/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  User get getUser => _user!;
  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    //print(_user?.name);
    notifyListeners();
  }
}
