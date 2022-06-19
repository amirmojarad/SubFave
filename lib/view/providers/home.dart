import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/collection.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/providers/favorite_words.dart';
import 'package:subfave/view/screens/config.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<Word> faveWords = [];

  Future<bool> getCollectionsAndFaveWords() async{
    await getWordsTitle();
    await getCollections();
    return true;
  }


  Future<List<Word>> getWordsTitle() async {
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
    }
    notifyListeners();
    return faveWords;
  }

  List<Collection> collections = [];
  Future<void> getCollections() async {
    await user.loadUser();
    var response = await http
        .get(Uri.parse("http://localhost:8080/users/collections/all"), headers: {
      'Authorization': 'Bearer ${user.token}',
    });
    if (response.statusCode == 200){
      List<dynamic> jsonBodyResponse = jsonDecode(response.body);
      print(jsonBodyResponse);
      for (var item in jsonBodyResponse){
        collections.add(Collection.fromJson(item));
      }
    }
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   print("ASDSADASDASD"+jsonResponse);
    //   // for (var item in jsonResponse){
    //   //   collections.add(Collection.fromJson(item));
    //   // }
    //   // print(collections);
    // }
    notifyListeners();
  }
}
