import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/controllers/subfave.dart';
import 'package:subfave/models/user.dart';

class LoginProvider extends SubfaveMainProvider {
  bool rememberMe = false;

  void tapOnRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> changePassword() async {
    // Todo change password method, handle ui and backend;
  }

  Future<bool> login(String email, String password) async {
    var body = {"email": "email", "password": "admin"};
    var res = await super.postRequest(body, 'http://localhost:8080/login');
    int statusCode = res.statusCode;
    if (statusCode == 200) {
      User user = User.fromJson({
        "user": {
          "username": "",
          "email": email,
          "token": jsonDecode(res.body)["token"]
        }
      });
      user.save('user', user.toJson());
      return true;
    } else if (statusCode == 400) {
    } else {}
    return false;
  }
}
