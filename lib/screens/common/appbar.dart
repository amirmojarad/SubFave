import 'package:flutter/material.dart';

AppBar getAppBar(GlobalKey<ScaffoldState> _key) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        _key.currentState!.openDrawer();
      },
    ),
  );
}
