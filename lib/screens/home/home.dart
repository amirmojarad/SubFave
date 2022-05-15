import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:subfave/screens/common/appbar.dart';
import 'package:subfave/screens/common/card_item.dart';
import 'package:subfave/screens/common/drawer.dart';
import 'package:subfave/screens/common/subfave_card.dart';
import 'package:subfave/screens/config.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: SubfaveDrawer(),
      appBar:getAppBar(_key) ,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SubfaveCardItem(title: "Search Movies"),
                      SizedBox(width: 16),
                      SubfaveCardItem(title: "Favorites"),
                      SizedBox(width: 16),
                      SubfaveCardItem(title: "Vocabs"),
                      SizedBox(width: 16),
                      SubfaveCardItem(title: "Upload Subtitle"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



