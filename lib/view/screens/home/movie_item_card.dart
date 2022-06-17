
import 'package:flutter/material.dart';

class MovieCardItem extends StatelessWidget {
  const MovieCardItem(
      {Key? key, required this.imageURL, required this.movieTitle})
      : super(key: key);
  final String movieTitle;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Tooltip(
        message: movieTitle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageURL,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
