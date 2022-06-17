import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/file.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/models/word.dart';
import 'package:http/http.dart' as http;

class WordsProvider with ChangeNotifier {
  List<Word> selectedWords = [];
  List<Word> searchedWords = [];

  Future<void> searchWords(String title) async {
    file = await file.loadFile();
    await user.loadUser();
    searchedWords.clear();
    var response = await http.get(
        Uri.parse(
            "http://localhost:8080/words/search?file_id=${file.id}&title=$title"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> words = jsonDecode(response.body);
      searchedWords
          .addAll(words.map((wordMap) => Word.FromJson(wordMap)).toList());
    }
    notifyListeners();
  }

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
    print(file.id);
    await user.loadUser();
    var response = await http.get(
        Uri.parse(
            "http://localhost:8080/words?file_id=${file.id}&page_number=$pageNumber"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    for (var item in jsonResponse["records"]) {
      fetchedWordsTitle.add(Word.FromJson(item));
    }
    notifyListeners();
    return fetchedWordsTitle;
  }
}
