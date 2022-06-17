import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:subfave/models/file.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/view/screens/config.dart';
import 'package:subfave/view/screens/subfave.dart';

void main() async {
  box = await Hive.openBox('subfave');
  user = await User.loadFromSharedPreferences();
  file = await File.loadFromSharedPreferences();
  runApp(const Subfave());
}
