import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

AppBar getAppBar(GlobalKey<ScaffoldState> _key) {
  return AppBar(
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
