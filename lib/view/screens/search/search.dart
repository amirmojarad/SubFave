import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/models/movie.dart';
import 'package:subfave/view/providers/search_movie.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/common/left_side_menu.dart';
import 'package:subfave/view/screens/search/search_result_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Movie> movies = context.read<SearchProvider>().movies;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      endDrawer: const SubfaveDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: context.watch<SearchProvider>().isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SubfaveAppBar(scaffoldKey: _key),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LeftSideMenu(),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Column(
                                  children: [
                                    TextField(
                                      onTap: () {
                                        context
                                            .read<SearchProvider>()
                                            .getSearchHistory();
                                      },
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        prefixIcon: IconButton(
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          iconSize: 30,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          icon: const Icon(Icons.search),
                                          onPressed: () async {
                                            await context
                                                .read<SearchProvider>()
                                                .queryMovies(
                                                    searchController.text);
                                          },
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 4,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    context
                                            .read<SearchProvider>()
                                            .movies
                                            .isEmpty
                                        ? SizedBox(
                                            height: 500,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        1.5 -
                                                    10,
                                                child: ListView.builder(
                                                  itemCount: context
                                                      .read<SearchProvider>()
                                                      .searchHistory
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        context
                                                            .read<
                                                                SearchProvider>()
                                                            .searchHistory[index],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineSmall,
                                                      ),
                                                      SizedBox(
                                                        child: const Divider(),
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.5 -
                                                            10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 1.1,
                                  child: ListView.builder(
                                      itemBuilder: (_, index) {
                                        searchController.clear();
                                        Movie movie = context
                                            .watch<SearchProvider>()
                                            .movies[index];
                                        return SearchResultCard(
                                          movie: movie,
                                          isFavorite: () => context
                                              .read<SearchProvider>()
                                              .checkMovieIsFavorited(movie),
                                          tappedOnFavorite: (moviePassed) =>
                                              context
                                                  .read<SearchProvider>()
                                                  .tappedOnFavoriteButton(
                                                      moviePassed),
                                        );
                                      },
                                      itemCount: movies.length))
                            ],
                          ),
                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
      key: _key,
      drawer: const SubfaveDrawer(),
    );
  }
}
