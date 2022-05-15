import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:subfave/screens/config.dart';
import 'package:subfave/screens/subfave.dart';

void main() async {
  box = await Hive.openBox('subfave');
  runApp(const Subfave());
}
