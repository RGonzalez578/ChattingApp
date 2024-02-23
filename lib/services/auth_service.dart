import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/services/crash_reporter_service.dart';

class AuthService extends ChangeNotifier {
  static initService() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final _crashReporter = CrashReporter();

  Future<String?> signUpEmailPass(
      String email, String pass, String displayName) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      if (credential.user != null) {
        await credential.user!.updateDisplayName(displayName);
      }
      // TODO: Store user into sharedPrefs
      // _prefs.setString("username", username);
      return null;
    } on FirebaseAuthException catch (e) {
      // TODO: Specify better the error for sign up with email & password
      _crashReporter.reportProblem("TEST CRASH ${e.code}");
      return e.code;
    }
  }

  Future<String?> loginEmailPass(String email, String pass) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      // TODO: Specify better the error for login with email & password
      _crashReporter.reportProblem(e.code);
      return e.code;
    } catch (e) {
      // TODO: Specify better the error for login with email & password on fatal error
      _crashReporter.reportProblem(e.toString());
      return e.toString();
    }
  }

  Future<bool> isLoggedIn() async {
    // String? username = _prefs.getString('username');
    if (_firebaseAuth.currentUser != null) return true;
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
    // return _prefs.getString('username') ?? 'DefaultValue';
    return _firebaseAuth.currentUser?.displayName ??
        _firebaseAuth.currentUser?.email;
  }

  void updateUsername(String newUsername) {
    _prefs.setString('username', newUsername);
    notifyListeners();
  }
}
