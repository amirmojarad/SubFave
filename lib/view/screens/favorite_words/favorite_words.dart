import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/providers/favorite_words.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/common/words_page.dart';
import 'package:subfave/view/screens/words/words.dart';

class FavoriteWordsScreen extends StatelessWidget {
  FavoriteWordsScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const SubfaveDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SubfaveAppBar(scaffoldKey: _key),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = context.watch<FavoriteWordsProvider>().faveWords;
                  return WordsGridList(
                    width: width,
                    height: height,
                    items: items,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
