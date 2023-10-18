import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static initService() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> login(String username) async {
    try {
      _prefs.setString("username", username);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? username = await _prefs.getString('username');
    if (username != null) return true;
    return false;
  }

  logout() {
    try {
      _prefs.clear();
    } catch (e) {
      print(e);
    }
  }

  String? getUsername() {
    return _prefs.getString('username') ?? 'DefaultValue';
  }

  void updateUsername(String newUsername) {
    _prefs.setString('username', newUsername);
    notifyListeners();
  }
}
