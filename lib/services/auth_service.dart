import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/services/crash_reporter_service.dart';

class AuthService extends ChangeNotifier {
  static initService() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static final crashReporter = CrashReporter();

  Future<bool> registerUser (String email, String pass) async {
    try {
      crashReporter.reportProblem("TEST CRASH");
      UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      print(credential);
    } catch (e) {
      crashReporter.reportProblem("TEST CRASH");
    }
    return true;
  }

  Future<void> login(String username, String pass) async {
    try {

      // _prefs.setString("username", username);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? username = _prefs.getString('username');
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
