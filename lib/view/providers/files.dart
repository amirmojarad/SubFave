import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/file.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/view/screens/config.dart';

class FilesProvider with ChangeNotifier {
  List<File> files = [];

  Future<List<File>> getAllFiles() async {
    user = await user.loadUser();
    var response = await http.get(
      Uri.parse("http://localhost:8080/users/files/all"),
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);
      files.addAll(responseBody.map((e) => File.fromJson(e)).toList());
      notifyListeners();
    }
    return files;
  }
}
