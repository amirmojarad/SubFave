class Movie {
  final int id;
  final String title,
      year,
      imageUrl,
      runtimeStr,
      genres,
      imdbRating,
      plot,
      stars,
      metacriticRating;
  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.runtimeStr,
    required this.genres,
    required this.imdbRating,
    required this.plot,
    required this.stars,
    required this.metacriticRating,
  });
  factory Movie.fromJson(Map<String, dynamic> jsonSchema) {
    return Movie(
      id: jsonSchema["id"] ?? "",
      genres: jsonSchema["genres"] ?? "",
      imageUrl: jsonSchema["image_url"] ?? "",
      imdbRating: jsonSchema["imDbRating"] ?? "",
      metacriticRating: jsonSchema["metacriticRating"] ?? "",
      plot: jsonSchema["plot"] ?? "",
      runtimeStr: jsonSchema["runtimeStr"] ?? "",
      stars: jsonSchema["stars"] ?? "",
      title: jsonSchema["title"] ?? "",
      year: jsonSchema["year"] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "genres": genres,
      "imageUrl": imageUrl,
      "imdbRating": imdbRating,
      "metacriticRating": metacriticRating,
      "plot": plot,
      "runtimeStr": runtimeStr,
      "stars": stars,
      "title": title,
      "year": year,
    };
  }
}
