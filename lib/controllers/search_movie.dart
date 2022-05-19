import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/models/user.dart';
import 'package:subfave/screens/config.dart';

class SearchProvider with ChangeNotifier {
  final List<Movie> movies = [];
  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> queryMovies(String title) async {
    startLoading();
    user ??= await User.loadFromSharedPreferences();
    var res = await http.get(
      Uri.parse("http://localhost:8080/movies/search/query/$title"),
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
    );
    int statusCode = res.statusCode;
    List<dynamic> jsonBody = await jsonDecode(res.body);
    if (statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(res.body);
      for (var item in responseData) {
        movies.add(Movie.fromJson(item));
      }
    }
    stopLoading();
  }
}
