import 'package:flutter/material.dart';
import 'package:subfave/models/movie.dart';
import 'package:subfave/screens/search/movie_image.dart';
import 'package:subfave/screens/search/movie_plot_text.dart';
import 'package:subfave/screens/search/search_result_card_top_section.dart';
import 'package:subfave/screens/search/staring_text.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            children: [
              MovieImage(
                imageURL: movie.imageUrl,
              ),
              Column(
                children: [
                  SearchResultCardTopSection(
                    genres: movie.genres,
                    imdbRating: movie.imdbRating,
                    title: movie.title,
                  ),
                  MoviePlotText(plot: movie.plot),
                  StaringText(stars: movie.stars)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
