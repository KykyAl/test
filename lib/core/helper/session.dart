import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static setUsername(username) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('username', username);
  }

  static deleteUsername() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('username');
  }

  static Future<String?> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final data = await pref.getString('username');
    return data;
  }
}
