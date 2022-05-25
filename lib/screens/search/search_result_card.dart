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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Theme.of(context).colorScheme.primary,
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
                child: Row(
                  children: [
                    MovieImage(
                      imageURL: movie.imageUrl,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / 1.5 - 400,
                            child: Flexible(
                              child: Text(
                                movie.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                              ),
                            ),
                          ),
                          Text(
                            movie.genres,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(0.6),
                                ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star_border,
                                  color: Colors.yellow, size: 25),
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
                                      fontWeight: FontWeight.w200,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.7),
                                    ),
                              )
                            ],
                          ),
                          SizedBox(
                            width:
                                MediaQuery.of(context).size.width / 1.5 - 400,
                            child: Flexible(
                              child: Text(
                                movie.plot,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.5),
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Staring:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background
                                          .withOpacity(0.7),
                                    ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5 -
                                    430,
                                child: Flexible(
                                  child: Text(
                                    movie.stars,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(0.5),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: IconButton(
                              iconSize: 35,
                              icon: Icon(
                                Icons.favorite_border_rounded,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       SearchResultCardTopSection(
                    //         genres: movie.genres,
                    //         imdbRating: movie.imdbRating,
                    //         title: movie.title,
                    //       ),
                    //       MoviePlotText(plot: movie.plot),
                    //       StaringText(stars: movie.stars),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
