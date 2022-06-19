import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/file.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/models/word.dart';
import 'package:subfave/view/screens/config.dart';

class FilesProvider with ChangeNotifier {


  int pageNumber = 1;

  void pageNumberDecrement() {
    pageNumber--;
  }

  void pageNumberIncrement() {
    pageNumber++;
  }

  final List<Word> fetchedWordsTitle = [];
  Future<List<Word>> getWordsTitle() async {
    fetchedWordsTitle.clear();
    file = await file.loadFile();
    await user.loadUser();
    var response = await http.get(
        Uri.parse(
            "http://localhost:8080/words?file_id=${file.id}&page_number=$pageNumber"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    for (var item in jsonResponse["records"]) {
      fetchedWordsTitle.add(Word.fromJson(item));
    }
    notifyListeners();
    return fetchedWordsTitle;
  }

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
