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
    this.movies.clear();
    user ??= await User.loadFromSharedPreferences();
    Map<String, dynamic> jsonBodyRequest = {
      "title": title,
      "sort_by": "id",
    };

    var res = await http.post(
      Uri.parse("http://localhost:8080/movies/search"),
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
      body: jsonEncode(jsonBodyRequest),
    );
    int statusCode = res.statusCode;
    if (statusCode == 200 || statusCode == 201 ) {
      final List<dynamic> responseData = jsonDecode(res.body);
      for (var item in responseData) {
        movies.add(Movie.fromJson(item));
      }
    }
    stopLoading();
  }
}
