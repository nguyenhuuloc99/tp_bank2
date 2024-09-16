import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static late SharedPreferences prefs;

  SharedManager._internal();

  static final SharedManager _instance = SharedManager._internal();

  factory SharedManager() => _instance;

  static SharedManager get instance => _instance;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

   void save<T>(T value, String key) {
    if (value is String) {
      prefs.setString(key, value);
    }
    if (value is bool) {
      prefs.setBool(key, value);
    }
    if (value is int) {
      prefs.setInt(key, value);
    }
    if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  bool getLogin() {
    return prefs.getBool('Login') ?? false;
  }


  static clearAll() {
    prefs.clear();
  }


}
