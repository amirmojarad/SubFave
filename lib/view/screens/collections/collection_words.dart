import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/screens/common/appbar.dart';
import 'package:subfave/view/screens/common/word_screen.dart';
import 'package:http/http.dart' as http;
import 'package:subfave/view/screens/config.dart';

class CollectionWordsScreen extends StatelessWidget {
  CollectionWordsScreen({
    Key? key,
    required this.words,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final List<Word> words;

  final List<Word> fetchedWords = [];
  Future<List<Word>> getWords(String title) async {
    fetchedWords.clear();
    await user.loadUser();
    var response = await http.get(
        Uri.parse("http://localhost:8080/words/collections?title=$title"),
        headers: {
          'Authorization': 'Bearer ${user.token}',
        });
    List<dynamic> jsonResponse = jsonDecode(response.body);
    for (var item in jsonResponse) {
      fetchedWords.add(Word.fromJson(item));
    }
    return fetchedWords;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                SubfaveAppBar(scaffoldKey: _key),
                SizedBox(
                  height: height,
                  width: width,
                  child: GridView.count(
                    crossAxisCount: 9,
                    children: words
                        .map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, bottom: 16),
                            child: Container(
                              width: 400,
                              height: 100,
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () async {
                                    await getWords(e.title);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WordScreen(words: fetchedWords),
                                        ));
                                  },
                                  child: Center(
                                    child: Text(
                                      e.title,
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
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
