import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/screens/config.dart';
import 'package:http/http.dart' as http;

class FavoriteWordsProvider with ChangeNotifier {
  List<Word> faveWords = [];

  Future<List<Word>> getWordsTitle() async {
    faveWords.clear();
    // file = await file.loadFile();
    await user.loadUser();
    var response = await http.get(
        Uri.parse(
            "http://localhost:8080/users/favorite_words"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    for (var item in jsonResponse["records"]) {
      faveWords.add(Word.fromJson(item));
    }
    notifyListeners();
    return faveWords;
  }
}
