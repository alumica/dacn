import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs!;

  static set(String key, Object obj) {
    _prefs!.setString(key, jsonEncode(obj));
  }

  static dynamic get(String key) {
    String? temp = _prefs!.getString(key);
    return temp == null ? null : jsonDecode(temp);
  }

  static bool isSignedIn() {
    var temp = _prefs!.getString('user');
    bool value = temp != null;
    return value;
  }

  static void deleteAllSharedPrefs() {
    _prefs!.clear();
  }
}
