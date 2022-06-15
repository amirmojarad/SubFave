import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/words.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/drawer.dart';

class WordsPage extends StatelessWidget {
  WordsPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          future: context
              .read<WordsProvider>()
              .getWordsTitle(context.read<WordsProvider>().fileID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = context.read<WordsProvider>().fetchedWordsTitle;
              var selectedItems = context.read<WordsProvider>().selectedWords;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SubfaveAppBar(scaffoldKey: _key),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 150,
                        child: GridView.count(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 8,
                          children: items.map((word) {
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
                                    child: Flexible(
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
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).colorScheme.background,
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                            offset: Offset(-3, 7),
                                            color:
                                                Theme.of(context).dividerColor)
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
                          }).toList(),
                        ),
                      )
                      // SizedBox(
                      //     width: MediaQuery.of(context).size.width-100,
                      //     height: MediaQuery.of(context).size.height - 150,
                      //     child: GridView.count(
                      //       shrinkWrap: true,
                      //       crossAxisCount: 8,
                      //       childAspectRatio: 1.0,
                      //       padding: const EdgeInsets.all(8),
                      //       mainAxisSpacing:4,
                      //       crossAxisSpacing: 4,
                      //       children: items.map((word){
                      //         context.read<WordsProvider>().isWordSelected(word);
                      //         return Stack(

                      //           children: [
                      //             Container(
                      //               child: Material(
                      //                 borderRadius: BorderRadius.circular(8),
                      //                 child: InkWell(
                      //                   borderRadius: BorderRadius.circular(8),
                      //                   onTap: () {
                      //                     context.read<WordsProvider>().addWordToSelectedWords(word);
                      //                     setState(() {

                      //                     });
                      //                   },
                      //                   child: Center(
                      //                     child: Flexible(
                      //                       child: Text(
                      //                         word.title,
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .headlineSmall!
                      //                             .copyWith(fontSize: 14),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(8),
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .background,
                      //                 border: Border.all(
                      //                   color:
                      //                       Theme.of(context).colorScheme.primary,
                      //                   width: 3,
                      //                 ),
                      //               ),
                      //             ),
                      //             context.read<WordsProvider>().isWordSelected(word)
                      //                 ? Padding(
                      //                     padding: const EdgeInsets.only(
                      //                         top: 4.0, left: 4),
                      //                     child: Icon(
                      //                       FeatherIcons.checkCircle,
                      //                       size: 28,
                      //                       color: Theme.of(context)
                      //                           .selectedRowColor,
                      //                     ),
                      //                   )
                      //                 : Container(),
                      //           ],
                      //         );
                      //       }).toList()
                      //     )

                      //     // child: GridView.builder(
                      //     //   shrinkWrap: true,
                      //     //   itemCount: items.length,
                      //     //   // itemCount: context
                      //     //   //     .read<WordsProvider>()
                      //     //   //     .fetchedWordsTitle
                      //     //   //     .length,
                      //     //   gridDelegate:
                      //     //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     //     crossAxisCount: 8,
                      //     //     crossAxisSpacing: 8,
                      //     //     mainAxisSpacing: 8,
                      //     //   ),
                      //     //   itemBuilder: (BuildContext context, int index) {
                      //     //     var word = items[index];
                      //     //     // context.read<WordsProvider>().isWordSelected(word);
                      //     //     return Stack(

                      //     //       children: [
                      //     //         Container(
                      //     //           child: Material(
                      //     //             borderRadius: BorderRadius.circular(8),
                      //     //             child: InkWell(
                      //     //               borderRadius: BorderRadius.circular(8),
                      //     //               onTap: () {
                      //     //                 provider.addWordToSelectedWords(word);
                      //     //                 // context.read<WordsProvider>().addWordToSelectedWords(word);
                      //     //                 setState(() {

                      //     //                 });
                      //     //               },
                      //     //               child: Center(
                      //     //                 child: Flexible(
                      //     //                   child: Text(
                      //     //                     items[index].title,
                      //     //                     style: Theme.of(context)
                      //     //                         .textTheme
                      //     //                         .headlineSmall!
                      //     //                         .copyWith(fontSize: 14),
                      //     //                   ),
                      //     //                 ),
                      //     //               ),
                      //     //             ),
                      //     //           ),
                      //     //           decoration: BoxDecoration(
                      //     //             borderRadius: BorderRadius.circular(8),
                      //     //             color: Theme.of(context)
                      //     //                 .colorScheme
                      //     //                 .background,
                      //     //             border: Border.all(
                      //     //               color:
                      //     //                   Theme.of(context).colorScheme.primary,
                      //     //               width: 3,
                      //     //             ),
                      //     //           ),
                      //     //         ),
                      //     //         provider.isWordSelected(word)
                      //     //             ? Padding(
                      //     //                 padding: const EdgeInsets.only(
                      //     //                     top: 4.0, left: 4),
                      //     //                 child: Icon(
                      //     //                   FeatherIcons.checkCircle,
                      //     //                   size: 28,
                      //     //                   color: Theme.of(context)
                      //     //                       .selectedRowColor,
                      //     //                 ),
                      //     //               )
                      //     //             : Container(),
                      //     //       ],
                      //     //     );
                      //     //   },
                      //     // ),
                      //     ),
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
