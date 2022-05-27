import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/left_side_menu.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/left_side_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Add New Subtitle",
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          FeatherIcons.plus,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
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
                          HomeMiddleSectionHList(
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
                          HomeMiddleSectionHList(
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
                          HomeMiddleSectionHList(
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

class HomeMiddleSectionHList extends StatelessWidget {
  const HomeMiddleSectionHList(
      {Key? key, required this.width, required this.list, required this.title})
      : super(key: key);
  final String title;
  final List<Widget> list;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          child: Divider(),
          width: width - 280,
        ),
        SizedBox(
          width: width - 280,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return list[index];
              },
            ),
          ),
        )
      ],
    );
  }
}

class FavoriteCategoryCard extends StatelessWidget {
  const FavoriteCategoryCard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 200,
        height: 100,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
