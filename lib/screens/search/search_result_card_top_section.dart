
import 'package:flutter/material.dart';

class SearchResultCardTopSection extends StatelessWidget {
  const SearchResultCardTopSection({
    Key? key,
    required this.title,
    required this.imdbRating,
    required this.genres,
  }) : super(key: key);

  final String title;
  final String imdbRating;
  final String genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: [
            Row(
              children: [
                const Icon(Icons.star_border, color: Colors.yellow),
                Text(imdbRating)
              ],
            ),
            Text(genres),
          ],
        )
      ],
    );
  }
}
