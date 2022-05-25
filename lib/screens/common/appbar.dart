import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context,GlobalKey<ScaffoldState> _key) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text("Subfave"),
    actions: [
      IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        _key.currentState!.openEndDrawer();
      },
    ),
    ],
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        _key.currentState!.openDrawer();
      },
    ),
  );
}
