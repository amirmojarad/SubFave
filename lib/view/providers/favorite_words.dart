import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/screens/config.dart';
import 'package:http/http.dart' as http;

class FavoriteWordsProvider with ChangeNotifier {
List<Word> faveWords = [];

  Future<List<Word>>  getWordsTitle() async {
    faveWords.clear();
    await user.loadUser();
    var response = await http
        .get(Uri.parse("http://localhost:8080/users/favorite_words"), headers: {
      'Authorization': 'Bearer ${user.token}',
    });
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse) {
        faveWords.add(Word.fromJson(item));
      }
    }else if (response.statusCode == 409){
      return faveWords;
    }

    notifyListeners();
    return faveWords;
  }

}
