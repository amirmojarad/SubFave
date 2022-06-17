library config.globals;

import 'package:hive/hive.dart';
import 'package:subfave/models/file.dart';
import 'package:subfave/models/user.dart';
import 'package:subfave/view/providers/theme.dart';
import 'package:subfave/view/providers/words.dart';

ThemeProvider currentTheme = ThemeProvider();
var box;
WordsProvider wordsProvider = WordsProvider();
User user = User(); 
File file = File();