import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/view/providers/words.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/drawer.dart';
import 'package:subfave/view/screens/words/floating_action_button.dart';
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
      floatingActionButton: getWordsPageFloatingActionButton(context, width),
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
