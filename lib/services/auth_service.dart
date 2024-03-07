import 'package:chat_app/services/injection_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/services/crash_reporter_service.dart';
import 'package:chat_app/core/error_types.dart';

import 'navigation_service.dart';

class AuthService extends ChangeNotifier {
  static late final SharedPreferences _prefs;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final _crashReporter = CrashReporter();

  static initService() async {
    try {
      final navigationService = getIt<NavigationService>();
      _firebaseAuth.authStateChanges().listen((User? user) {
        if (user == null) {
          navigationService.pushReplacementNamed('/');
        }
      });
    } catch (e) {
      // TODO: Control navigatorKey.currentState null at first frame
    }
  }

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
      if (e.code == operationNotAllowed || e.code == emailInUse) {
        _crashReporter.reportProblem(
            msg: "Error in signup email process: ${e.code}", info: [e.toString()]);
      }
      return e.code;
    } catch (e) {
      _crashReporter.reportProblem(
          msg: "Unexpected error in signup email process: $e", info: [e.toString()]);
    }
  }

  Future<String?> loginEmailPass(String email, String pass) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == tooManyRequests ||
          e.code == userDisabled ||
          e.code == userNotFound) {
        _crashReporter.reportProblem(
            msg: "Error in login email process: ${e.code}", info: [e.toString()]);
      }
      return e.code;
    } catch (e) {
      _crashReporter.reportProblem(
          msg: "Unexpected error in login email process: $e", info: [e.toString()]);
      return e.toString();
    }
  }

  Future<bool> isLoggedIn() async {
    if (_firebaseAuth.currentUser != null) return true;
    return false;
  }

  Future<void> logout() async {
    try {
      // _prefs.clear();
      await _firebaseAuth.signOut();
    } catch (e) {
      _crashReporter.reportProblem(msg: e.toString());
    }
  }

  Future<void> sendEmailResetPass(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // TODO: save error logs locally
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

  String? validateErrors(String value) {
    switch (value) {
      case invalidCredential:
        return 'Credenciales inválidas';
      case invalidEmail:
        return 'Email inválido';
      case userDisabled:
        return 'Usuario deshabilitado';
      case userNotFound:
        return 'El usuario no existe';
      case wrongPassword:
        return 'Contraseña incorrecta';
      case emailInUse:
        return 'El email ya se encuentra en uso';
      case operationNotAllowed:
        return 'Ha ocurrido un error al crear la cuenta.\nIntenta de nuevo más tarde';
      case weakPassword:
        return 'Contraseña débil';
      case tooManyRequests:
        return 'Por razones de seguridad se ha bloqueado temporalmente su cuenta.\nIntenta de nuevo más tarde o cambia la contraseña.';

      default:
        if (value.isNotEmpty) {
          return 'Ha ocurrido un error';
        }
        return null;
    }
  }
}
