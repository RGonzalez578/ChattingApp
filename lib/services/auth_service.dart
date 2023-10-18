import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
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

  void updateUsername(String newUsername){
    // TODO: Update username un chatpage with a button.
  }
}
