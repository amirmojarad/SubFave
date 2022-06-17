import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/models/user.dart';
import 'package:subfave/view/providers/subfave.dart';
import 'package:subfave/view/screens/config.dart';

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

  bool wrongPassword = false;
  bool invalidUsername = false;

  Future<bool> login(String email, String password) async {
    var body = {"email": email, "password": password};
    var res = await super.postRequest(body, 'http://localhost:8080/login');
    int statusCode = res.statusCode;
    var responseBody = await jsonDecode(res.body);
    print(responseBody);
    print(responseBody["token"]);
    if (statusCode == 200) {
      user = User.fromJson(responseBody);
      await user.save('user', user.toJson());
      return true;
    } else if (statusCode == 400) {
      var decodedBody = jsonDecode(res.body);
      String message = decodedBody["message"];
      if (message.contains("invalid")) {
        invalidUsername = true;
      } else if (message.contains("wrong")) {
        wrongPassword = true;
      }
      notifyListeners();
      invalidUsername = false;
      wrongPassword = false;
      return false;
    } else {}
    return false;
  }
}
