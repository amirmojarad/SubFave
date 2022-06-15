import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/models/word.dart';
import 'package:http/http.dart' as http;

class WordsProvider with ChangeNotifier {
  List<Word> selectedWords = [];

  bool isWordSelected(Word word) => selectedWords.contains(word);

  void removeWordFromSelectedWords(Word word) {
    if (isWordSelected(word)) {
      selectedWords.remove(word);
    }
    notifyListeners();
  }

  void addWordToSelectedWords(Word word) {
    selectedWords.add(word);
    notifyListeners();
  }

  void addToSelectedWords(List<Word> words) {
    for (var item in words) {
      if (!selectedWords.contains(item)) {
        selectedWords.add(item);
      }
    }
    notifyListeners();
  }

  int fileID = 0;
  final List<Word> fetchedWordsTitle = [];
  Future<List<Word>> getWordsTitle(int fileID) async {
    fetchedWordsTitle.clear();
    await user.loadUser();
    var response = await http.get(
        Uri.parse("http://localhost:8080/words?file_id=$fileID"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    List<dynamic> wordTitleList = jsonDecode(response.body);
    for (var item in wordTitleList) {
      fetchedWordsTitle.add(Word.FromJson(item));
    }
    return fetchedWordsTitle;
  }
}
