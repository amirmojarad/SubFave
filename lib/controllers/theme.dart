import 'package:flutter/material.dart';
import 'package:subfave/screens/config.dart';

class ThemeProvider with ChangeNotifier {
    bool isDark = false;
    
    ThemeProvider() {
      if (box.containsKey('currentTheme')){
        isDark = box.get('currentTheme');
      }else{
        box.put('currentTheme', isDark);
      }
    }

    ThemeMode currentTheme() {

      return isDark ? ThemeMode.dark : ThemeMode.light;
    }

    void changeTheme(bool dark) {
      isDark = dark;
      box.put('currentTheme', isDark);
      notifyListeners();
    }

}