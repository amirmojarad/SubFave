import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/view/screens/config.dart';

class SearchProvider with ChangeNotifier {
  final List<Movie> movies = [];
  List<dynamic> searchHistory = [];
  bool isLoading = false;
  final List<Movie> favoriteMovies = [];
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
    user.loadUser();
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
    if (statusCode == 200 || statusCode == 201) {
      final List<dynamic> responseData = jsonDecode(res.body);
      for (var item in responseData) {
        movies.add(Movie.fromJson(item));
      }
    }
    stopLoading();
  }

  void tappedOnFavoriteButton(Movie movie) {
    favoriteMovies.add(movie);
    notifyListeners();
  }

  bool checkMovieIsFavorited(Movie movie) {
    return favoriteMovies.contains(movie);
  }

  Future<void> getSearchHistory() async {
    searchHistory.clear();
    var response = await http.get(
      Uri.parse('http://localhost:8080/users/searchKeywords'),
      headers: {
        'Authorization': 'Bearer ${user.token}',
      },
    );
    if (response.statusCode == 200) {
      searchHistory = await jsonDecode(response.body) as List<dynamic>;
    } else {
      print(response.statusCode);
    }
    notifyListeners();
  }
}
