import 'package:flutter/material.dart';
import 'package:subfave/screens/config.dart';

class ThemeProvider with ChangeNotifier {
    static bool _isDark = false;
    
    ThemeProvider() {
      if (box.containsKey('currentTheme')){
        _isDark = box.get('currentTheme');
      }else{
        box.put('currentTheme', _isDark);
      }
    }

    ThemeMode currentTheme() {

      return _isDark ? ThemeMode.dark : ThemeMode.light;
    }

    void changeTheme() {
      _isDark = !_isDark;
      box.put('currentTheme', _isDark);
      notifyListeners();
    }

}