import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:subfave/models/subfave.dart';

class User extends SubfaveSuperModel {
  final String username, token, email, fullName;
  final int id;
  User.withData({
    required this.email,
    required this.token,
    required this.username,
    required this.id,
    required this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User.withData(
      fullName: json["user"]["full_name"] ?? "",
      email: json["user"]["email"],
      token: json["token"],
      username: json["user"]["username"],
      id: json["user"]["id"],
    );
  }

  Future<User> loadUser() async {
    user = await User.loadFromSharedPreferences();
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "user": {
        "email": email,
        "username": username,
        "id": id,
        "full_name": fullName
      }
    };
  }

  @override
  String toString() {
    return "id: $id username: $username, email: $email, token: $token, full_name: $fullName";
  }

  static Future<User> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadedData = prefs.getString('user');
    return User.fromJson(jsonDecode(loadedData!) as Map<String, dynamic>);
  }
}

User user =
    User.withData(email: "", token: "", username: "", id: -1, fullName: "");
