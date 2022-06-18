import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:subfave/models/handlers/file_handler.dart';
import 'package:subfave/view/screens/config.dart';

class User extends FileHandler {
  final String username, token, email, fullName;
  String imageUrl;
  final int id;
  User({
    this.email = "",
    this.token = "",
    this.username = "",
    this.id = 0,
    this.fullName = "",
    this.imageUrl = "",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json["user"]["full_name"] ?? "",
      email: json["user"]["email"] ?? "",
      token: json["token"] ?? "",
      username: json["user"]["username"] ?? "",
      id: json["user"]["id"] ?? "",
      imageUrl: json["user"]["image_url"] ?? "",
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
        "full_name": fullName,
        "image_url": imageUrl,
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
