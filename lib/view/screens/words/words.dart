import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/view/providers/words.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/words/words_page.dart';

class WordsPage extends StatefulWidget {
  WordsPage({Key? key}) : super(key: key);
  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController controller = TextEditingController();
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
                  onTap: () {
                    context.read<WordsProvider>().addToFavorites();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add To Favorites",
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                ),
              ),
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (value) {
                          return Container(
                            color: Colors.transparent,
                            height: 400,
                            width: width,
                            child: Container(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 2.5,
                                              height: 50,
                                              child: TextField(
                                                
                                                decoration: InputDecoration(
                                                  hintText: "e.g Attack on Titan",
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: Container(
                                                width: 100,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Create",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 16,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .background,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RecentCategories(width: width),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                            ),
                          );
                        });
                  },
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
              bool isFirstPage = context.watch<WordsProvider>().pageNumber == 1;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SubfaveAppBar(scaffoldKey: _key),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Container(
                          child: TextField(
                            onChanged: (value) async {
                              if (value.isEmpty) {
                                await context
                                    .read<WordsProvider>()
                                    .getWordsTitle();
                              } else {
                                await context
                                    .read<WordsProvider>()
                                    .searchWords(value);
                              }
                              // setState(() {});
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    width: 2,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                                      .read<WordsProvider>()
                                      .searchWords(controller.text);
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                          ),
                          width: width / 1.8,
                          height: 50,
                        ),
                      ),
                      //Search bar for words
                      WordsGridList(width: width, height: height, items: items),
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
                                  color: isFirstPage
                                      ? Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.2)
                                      : Theme.of(context).colorScheme.primary,
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
                                    onTap: isFirstPage
                                        ? () {}
                                        : () async {
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

class RecentCategories extends StatelessWidget {
  const RecentCategories({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Recent Categories",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: SizedBox(
              width: width,
              child: Divider(),
            ),
          ),
          SizedBox(
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                  CategoryCardItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 200,
        height: 50,
        child: Center(
            child: Text(
          "Category first",
          style: Theme.of(context).textTheme.headlineSmall,
        )),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 0.8),
        ),
      ),
    );
  }
}
