import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/search_movie.dart';
import 'package:subfave/models/movie.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/search/search_result_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 64),
          child: context.watch<SearchProvider>().isLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        // Search Bar
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 150,
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  iconSize: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                  icon: const Icon(Icons.search),
                                  onPressed: () async {
                                    await context
                                        .read<SearchProvider>()
                                        .queryMovies(searchController.text);
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(16)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 4,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Expanded(
                              flex: 4,
                              child: ListView.builder(
                                itemBuilder: (_, index) {
                                  Movie movie = context
                                      .watch<SearchProvider>()
                                      .movies[index];
                                  return SearchResultCard(movie: movie);
                                },
                                itemCount: context
                                    .watch<SearchProvider>()
                                    .movies
                                    .length,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
        ),
      ),
      key: _key,
      appBar: getAppBar(_key),
      drawer: const SubfaveDrawer(),
    );
  }
}
