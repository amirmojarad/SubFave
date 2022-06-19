import 'package:flutter/material.dart';
import 'package:subfave/view/screens/common/appbar.dart';

class WordScreen extends StatelessWidget {
  WordScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(children: [
          SubfaveAppBar(scaffoldKey: _key),
          FutureBuilder(builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) => Container());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
        ]),
      ),
    );
  }
}
