import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/view/providers/home.dart';
import 'package:subfave/view/screens/common/add_subtitle_fab.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/common/left_side_menu.dart';
import 'package:subfave/view/screens/home/favorite_category_card.dart';
import 'package:subfave/view/screens/home/movie_item_card.dart';
import 'package:subfave/view/screens/home/section.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubfaveAppBar(
                  scaffoldKey: _key,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftSideMenu(),
                    Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: FutureBuilder(
                          future: context.read<HomeProvider>().getWordsTitle(),
                          builder: (context, snapshot) {
                            var faveWords = context
                                .watch<HomeProvider>()
                                .faveWords
                                .take(10)
                                .toList();
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/favorite_words');
                                    },
                                    child: SubfaveSectionHeader(
                                      width: width,
                                      title: "Favorite Words",
                                      list: List.generate(
                                        faveWords.length,
                                        (index) => FavoriteCategoryCard(
                                          title: faveWords[index].title,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  SubfaveSectionHeader(
                                    width: width,
                                    title: "Collections",
                                    list: const [],
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                    Spacer(),
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
