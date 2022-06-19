import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/models/collection.dart';
import 'package:subfave/controllers/collection.dart';
import 'package:subfave/view/screens/collections/collection_words.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/left_side_menu.dart';
import 'package:subfave/view/screens/config.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                SubfaveAppBar(scaffoldKey: _key),
                Row(
                  children: [
                    const LeftSideMenu(),
                    const Spacer(),
                    SizedBox(
                      width: width - 300,
                      height: height,
                      child: FutureBuilder(
                        future:
                            context.read<CollectionProvider>().getCollections(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Collection> items =
                                context.watch<CollectionProvider>().collections;
                            return SizedBox(
                              height: height - 200,
                              width: width,
                              child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Container(
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                        width: 0.8,
                                      ),
                                    ),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CollectionWordsScreen(
                                                        words:
                                                            items[index].words),
                                                            
                                              ));
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 32),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  items[index].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                Text(
                                                  items[index]
                                                      .words
                                                      .length
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium!
                                                      .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
