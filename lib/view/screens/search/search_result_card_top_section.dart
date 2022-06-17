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
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
        // Row(
        //   children: [
        //     Row(
        //       children: [
        //         const Icon(Icons.star_border, color: Colors.yellow),
        //         Text(imdbRating)
        //       ],
        //     ),
        //     Text(genres),
        //   ],
        // )
      ],
    );
  }
}
