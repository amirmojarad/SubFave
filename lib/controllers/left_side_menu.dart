import 'package:flutter/material.dart';

class LeftSideMenuProvider with ChangeNotifier {
  int isSelected = 0;
  void chageSelectedValue(int newValue) {
    isSelected = newValue;
    notifyListeners();
  }
}
