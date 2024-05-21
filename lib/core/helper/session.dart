import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  Rx<String> _token = ''.obs;

  bool get isAuth => _token.value != '';

  Future<void> authenticate(String token) async {
    _token.value = token;

    log("value ${_token.value}");

    try {
      final prefs = await SharedPreferences.getInstance();
      final data = jsonEncode({'token': token});
      await prefs.setString('data', data);
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<bool> tryLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('data')) {
      return false;
    }
    final extractedData =
        jsonDecode(prefs.getString('data')!) as Map<String, dynamic>;
    _token.value = extractedData['token'];
    log("message ${_token.value}");
    update();
    return true;
  }

  void logout() async {
    _token.value = '';
    update();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
