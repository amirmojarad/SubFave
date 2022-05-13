import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubfaveMainProvider with ChangeNotifier {
  bool isLoading = false;

  Future<http.Response> postRequest(
      Map<String, String> jsonRawData, String url) async {
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
