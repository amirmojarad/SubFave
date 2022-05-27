import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/search_movie.dart';
import 'package:subfave/models/movie.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/left_side_menu.dart';
import 'package:subfave/screens/search/search_result_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Movie> movies = context.watch<SearchProvider>().movies;

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
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      iconSize: 30,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      icon: const Icon(Icons.search),
                                      onPressed: () async {
                                        await context
                                            .read<SearchProvider>()
                                            .queryMovies(searchController.text);
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
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  height:
                                      MediaQuery.of(context).size.height / 1.1,
                                  child: ListView.builder(
                                      itemBuilder: (_, index) {
                                        searchController.clear();
                                        Movie movie = context
                                            .watch<SearchProvider>()
                                            .movies[index];
                                        return SearchResultCard(movie: movie);
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
          // : SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         SubfaveAppBar(scaffoldKey: _key),
          //         Center(
          //           child: SizedBox(
          //             width: MediaQuery.of(context).size.width,
          //             height: MediaQuery.of(context).size.height - 200,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 const LeftSideMenu(),
          //                 Padding(
          //                   padding: const EdgeInsets.only(right: 180.0),
          //                   child: Center(
          //                     child: Column(
          //                       crossAxisAlignment:
          //                           CrossAxisAlignment.start,
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         SizedBox(
          //                           width:
          //                               MediaQuery.of(context).size.width /
          //                                   2,
          //                           child: TextField(
          //                             controller: searchController,
          //                             decoration: InputDecoration(
          //                               prefixIcon: IconButton(
          //                                 hoverColor: Colors.transparent,
          //                                 splashColor: Colors.transparent,
          //                                 focusColor: Colors.transparent,
          //                                 highlightColor:
          //                                     Colors.transparent,
          //                                 iconSize: 30,
          //                                 color: Theme.of(context)
          //                                     .colorScheme
          //                                     .primary,
          //                                 icon: const Icon(Icons.search),
          //                                 onPressed: () async {
          //                                   await context
          //                                       .read<SearchProvider>()
          //                                       .queryMovies(
          //                                           searchController.text);
          //                                 },
          //                               ),
          //                               focusedBorder: OutlineInputBorder(
          //                                   borderSide: BorderSide(
          //                                     color: Theme.of(context)
          //                                         .colorScheme
          //                                         .primary,
          //                                     width: 2,
          //                                   ),
          //                                   borderRadius:
          //                                       BorderRadius.circular(16)),
          //                               enabledBorder: OutlineInputBorder(
          //                                   borderSide: BorderSide(
          //                                     color: Theme.of(context)
          //                                         .colorScheme
          //                                         .primary,
          //                                     width: 4,
          //                                   ),
          //                                   borderRadius:
          //                                       BorderRadius.circular(12)),
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                             width: MediaQuery.of(context)
          //                                     .size
          //                                     .width /
          //                                 2,
          //                             height: MediaQuery.of(context)
          //                                     .size
          //                                     .height /
          //                                 1.8,
          //                             child: ListView.builder(
          //                                 itemBuilder: (_, index) {
          //                                   searchController.clear();
          //                                   Movie movie = context
          //                                       .watch<SearchProvider>()
          //                                       .movies[index];
          //                                   return SearchResultCard(
          //                                       movie: movie);
          //                                 },
          //                                 itemCount: movies.length))
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ),
      ),
      key: _key,
      drawer: const SubfaveDrawer(),
    );
  }
}
