import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceModel {
  static late SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Map getString(String key) {
    String? user = _prefs.getString(key);
    return jsonDecode(user!);
  }
}
