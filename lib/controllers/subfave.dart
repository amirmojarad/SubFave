import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubfaveMainProvider with ChangeNotifier {
  bool isLoading = false;
  bool internalServerError = false;
  bool pageNotFoundError = false;
  bool badRequestError = false;
  bool passwordsAreNotEqual = false;

  bool passwordValidation = true;

  bool checkEmailValidation(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool checkPasswordValidation(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  Future<http.Response> postRequest(
    Map<String, String> jsonRawData,
    String url,
  ) async {
    loading();
    notifyListeners();
    var body = jsonEncode(jsonRawData);

    var res = await http.post(Uri.parse(url), body: body, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    loaded();
    notifyListeners();
    return res;
  }

  void loaded() {
    isLoading = false;
    notifyListeners();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }
}
