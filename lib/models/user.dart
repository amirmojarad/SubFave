import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:subfave/models/subfave.dart';

class User extends SubfaveSuperModel {
  final String username, token, email;
  User.withData({
    required this.email,
    required this.token,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User.withData(
        email: json["user"]["email"],
        token: json["token"],
        username: json["user"]["username"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "user": {
        "email": email,
        "username": username,
      }
    };
  }

  @override
  String toString() {
    return "username: $username, email: $email, token: $token";
  }

  static Future<User> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedData = prefs.getString('user');
    return User.fromJson(jsonDecode(loadedData!) as Map<String, dynamic>);
  }
}
