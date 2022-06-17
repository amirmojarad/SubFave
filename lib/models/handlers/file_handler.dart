import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FileHandler {
  Future<SharedPreferences> _callPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> save(String key, Map<String, dynamic> jsonMap) async {
    SharedPreferences prefs = await _callPrefs();
    return await prefs.setString(key, jsonEncode(jsonMap));
  }

  Future<Map<String, dynamic>> load(String key) async {
    SharedPreferences prefs = await _callPrefs();
    String? loadedData = prefs.getString(key);
    return jsonDecode(loadedData!) as Map<String, dynamic>;
  }
}
