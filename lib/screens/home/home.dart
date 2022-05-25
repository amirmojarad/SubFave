import 'package:flutter/material.dart';
import 'package:subfave/screens/common/card_item.dart';
import 'package:subfave/screens/common/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const SubfaveDrawer(),
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
                    children: [
                      SubfaveCardItem(
                        onTap: () => Navigator.pushNamed(context, '/search'),
                        title: "Search Movies",
                      ),
                      // const SizedBox(width: 16),
                      // SubfaveCardItem(
                      //   title: "Favorites",
                      //   onTap: () {},
                      // ),
                      // SizedBox(width: 16),
                      // SubfaveCardItem(title: "Vocabs", onTap: () {}),
                      // SizedBox(width: 16),
                      // SubfaveCardItem(title: "Upload Subtitle", onTap: () {}),
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
