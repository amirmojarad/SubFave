import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/words.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/words/next_page_button.dart';

class WordsPage extends StatefulWidget {
  WordsPage({Key? key}) : super(key: key);
  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(width - 50, 460, 60, 100),
            items: [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add To Favorites",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add To Category",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          );
        },
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
        child: FutureBuilder(
          future: context.read<WordsProvider>().getWordsTitle(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = context.read<WordsProvider>().fetchedWordsTitle;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    SubfaveAppBar(scaffoldKey: _key),
                    //Search bar for words
                    SizedBox(
                      width: width - 50,
                      height: height - 166,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 12,
                          crossAxisCount: 8,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var word = context
                              .watch<WordsProvider>()
                              .fetchedWordsTitle[index];
                          bool isSelected = context
                              .watch<WordsProvider>()
                              .isWordSelected(word);
                          return Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  if (context
                                      .read<WordsProvider>()
                                      .isWordSelected(word)) {
                                    context
                                        .read<WordsProvider>()
                                        .removeWordFromSelectedWords(word);
                                  } else {
                                    context
                                        .read<WordsProvider>()
                                        .addWordToSelectedWords(word);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    word.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context).colorScheme.background,
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                          offset: Offset(-3, 7),
                                          color: Theme.of(context).dividerColor)
                                    ]
                                  : [],
                              border: Border.all(
                                color: isSelected
                                    ? Theme.of(context).selectedRowColor
                                    : Theme.of(context).colorScheme.primary,
                                width: isSelected ? 4 : 3,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                color:  Theme.of(context).colorScheme.primary,
                              ),
                              child: Material(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                  onTap: () async {
                                    context
                                        .read<WordsProvider>()
                                        .pageNumberDecrement();
                                    await context
                                        .read<WordsProvider>()
                                        .getWordsTitle();
                                    setState(() {});
                                  },
                                  child: Icon(FeatherIcons.chevronLeft,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ),
                              ),
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              child: VerticalDivider(),
                              height: 50,
                              width: 0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              child: Material(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  onTap: () async {
                                    context
                                        .read<WordsProvider>()
                                        .pageNumberIncrement();
                                    await context
                                        .read<WordsProvider>()
                                        .getWordsTitle();
                                    setState(() {});
                                  },
                                  child: Icon(FeatherIcons.chevronRight,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                ),
                              ),
                              width: 50,
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SafeArea(
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}
