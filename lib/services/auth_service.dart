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

  Future<User?> signUpEmailPass (String email, String pass) async {
    try {
      _crashReporter.reportProblem("TEST CRASH");
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      // TODO: Store user into sharedPrefs
      // _prefs.setString("username", username);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // TODO: Specify better the error for sign up with email & password
      _crashReporter.reportProblem("TEST CRASH ${e.code}");
    }
    return null;
  }

  Future<Map<String, dynamic>> loginEmailPass(String email, String pass) async {
    print(_firebaseAuth.currentUser!.email);
    var result = Map<String, dynamic>();
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      // print(credential.user!.uid);
      result['user'] = credential.user;
      result['errorCode'] = null;
      return result;
    } on FirebaseAuthException catch (e) {
      // TODO: Specify better the error for login with email & password
      _crashReporter.reportProblem(e.code);
      result['user'] = null;
      result['errorCode'] = e.code;
      return result;
    } catch (e) {
      // TODO: Specify better the error for login with email & password on fatal error
      _crashReporter.reportProblem(e.toString());
      result['user'] = null;
      result['errorCode'] = 'fatal_error';
      return result;
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
