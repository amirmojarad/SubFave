import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/controllers/upload.dart';
import 'package:subfave/screens/common/add_subtitle_fab.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/left_side_menu.dart';
import 'package:subfave/screens/home/favorite_category_card.dart';
import 'package:subfave/screens/home/movie_item_card.dart';
import 'package:subfave/screens/home/section.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: const AddSubtitleFloatingActionButton(),
      key: _key,
      drawer: const SubfaveDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Column(
              children: [
                SubfaveAppBar(
                  scaffoldKey: _key,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftSideMenu(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Column(
                        children: [
                          SubfaveSectionHeader(
                            width: width,
                            title: "Categories",
                            list: const [
                              FavoriteCategoryCard(
                                title: "First",
                              ),
                              FavoriteCategoryCard(
                                title: "Second",
                              ),
                              FavoriteCategoryCard(
                                title: "Third",
                              ),
                              FavoriteCategoryCard(
                                title: "4th",
                              ),
                              FavoriteCategoryCard(
                                title: "5th",
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SubfaveSectionHeader(
                            width: width,
                            title: "Favorite Words",
                            list: const [
                              FavoriteCategoryCard(
                                title: "First",
                              ),
                              FavoriteCategoryCard(
                                title: "Second",
                              ),
                              FavoriteCategoryCard(
                                title: "Third",
                              ),
                              FavoriteCategoryCard(
                                title: "4th",
                              ),
                              FavoriteCategoryCard(
                                title: "5th",
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SubfaveSectionHeader(
                            width: width,
                            title: "Favorite Movies",
                            list: const [
                              MovieCardItem(
                                movieTitle: "Batman",
                                imageURL:
                                    'https://unsplash.com/photos/meqVd5zwylI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8YmF0bWFufGVufDB8fHx8MTY1MzU3MTExNg&force=true&w=1920',
                              ),
                              MovieCardItem(
                                movieTitle: "Batman",
                                imageURL:
                                    'https://unsplash.com/photos/meqVd5zwylI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8YmF0bWFufGVufDB8fHx8MTY1MzU3MTExNg&force=true&w=1920',
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
