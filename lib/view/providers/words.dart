import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/word.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/view/screens/config.dart';

class WordsProvider with ChangeNotifier {
  List<Word> selectedWords = [];

  List<String> selectedWordsToStringList() =>
      selectedWords.map((e) => e.title).toList();

  Future<void> addToFavorites() async {
    List<String> titles = selectedWordsToStringList();
    String jsonBody = jsonEncode(titles);
    var response = await http.post(
      Uri.parse("http://localhost:8080/users/favorite_words"),
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
      body: jsonBody,
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 409) {
      selectedWords.clear();
    }
    notifyListeners();
  }

  Future<void> searchWords(String title) async {
    // file = await file.loadFile();
    await user.loadUser();
    fetchedWordsTitle.clear();
    var response = await http.get(
        Uri.parse(
            "http://localhost:8080/words/search?file_id=${file.id}&title=$title"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
        print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> words = jsonDecode(response.body);
      fetchedWordsTitle
          .addAll(words.map((wordMap) => Word.fromJson(wordMap)).toList());
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
    // file = await file.loadFile();
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
}
