import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/models/movie.dart';
import 'package:subfave/view/screens/search/movie_image.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    Key? key,
    required this.movie,
    required this.tappedOnFavorite,
    required this.isFavorite
  }) : super(key: key);

  final Movie movie;
  final Function isFavorite;
  final Function(Movie movie) tappedOnFavorite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            highlightColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            onTap: () {},
            child: SizedBox(
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MovieImage(
                        imageURL: movie.imageUrl,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5 -
                                    400,
                                child: Flexible(
                                  child: Text(
                                    movie.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  movie.genres,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(FeatherIcons.star,
                                        color: Colors.yellowAccent, size: 25),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      movie.imdbRating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                            fontSize: 18,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5 -
                                          400,
                                  child: Flexible(
                                    child: Text(
                                      movie.plot,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .color!
                                                .withOpacity(0.8),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:24.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Staring:",
                                  style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .color,
                                          ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              1.5 -
                                          430,
                                      child: Flexible(
                                        child: Text(
                                          movie.stars,
                                               style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .color!
                                                .withOpacity(0.8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   child: IconButton(
                              //     iconSize: 35,
                              //     icon: Icon(
                              //       isFavorite() ? FeatherIcons.heart : Icons.favorite,
                              //       color:
                              //           Theme.of(context).colorScheme.primary,
                              //     ),
                              //     onPressed: () => tappedOnFavorite(movie),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
