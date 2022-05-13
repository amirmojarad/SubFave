import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/controllers/subfave.dart';

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
    if (!(super.checkEmailValidation(email) &&
        super.checkPasswordValidation(password))) {
      return false;
    }
    var body = {"email": "email", "password": "admin"};
    var res = await super.postRequest(body, 'http://localhost:8080/login');
    return false;
  }
}
