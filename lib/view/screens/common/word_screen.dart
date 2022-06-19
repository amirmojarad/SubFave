import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:subfave/models/word.dart';
import 'package:subfave/view/screens/common/appbar.dart';

class WordScreen extends StatelessWidget {
  WordScreen({Key? key, required this.words}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  final List<Word> words;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SubfaveAppBar(
                scaffoldKey: _key,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      words[0].title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(FeatherIcons.arrowLeft))
                  ],
                ),
              ),
              SizedBox(
                child: Divider(),
                width: width,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Column(
                  children: words
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom:32, ),
                          child: Container(
                            height: 200,
                            width: width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0, left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    e.sentence,
                                    style:
                                        Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  SizedBox(height: 64,),
                                  Text(
                                    e.duration,
                                    style:
                                        Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14,color: Theme.of(context).dividerColor, fontWeight: FontWeight.w400),
                                  )
                                ],
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
        )),
      ),
    );
  }
}
