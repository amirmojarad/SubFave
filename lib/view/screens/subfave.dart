import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/view/providers/favorite_words.dart';
import 'package:subfave/view/providers/files.dart';
import 'package:subfave/view/providers/home.dart';
import 'package:subfave/view/providers/left_side_menu.dart';
import 'package:subfave/view/providers/login.dart';
import 'package:subfave/view/providers/profile.dart';
import 'package:subfave/view/providers/search_movie.dart';
import 'package:subfave/view/providers/signup.dart';
import 'package:subfave/view/screens/auth/login/login.dart';
import 'package:subfave/view/screens/auth/signup/signup.dart';
import 'package:subfave/view/screens/common/scroll.dart';
import 'package:subfave/view/screens/favorite_words/favorite_words.dart';
import 'package:subfave/view/screens/files/files.dart';
import 'package:subfave/view/screens/home/home.dart';
import 'package:subfave/view/screens/profile/profile.dart';
import 'package:subfave/view/screens/search/search.dart';
import 'package:subfave/view/screens/words/words.dart';
import 'package:subfave/view/screens/theme/light/light_theme.dart' as light;
import 'package:subfave/view/screens/theme/dark/dark_theme.dart' as dark;
import 'package:subfave/view/screens/theme/dark/fonts.dart' as darkFonts;
import 'package:subfave/view/screens/theme/light/fonts.dart' as lightFonts;

import 'config.dart';

class Subfave extends StatefulWidget {
  const Subfave({Key? key}) : super(key: key);

  @override
  State<Subfave> createState() => _SubfaveState();
}

class _SubfaveState extends State<Subfave> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  LeftSideMenuProvider leftSideMenuProvider = LeftSideMenuProvider();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: light.backgroundColor,
        hintColor: light.hint,
        dividerColor: light.divider,
        selectedRowColor: light.green,
        colorScheme: const ColorScheme.light(
          error: Color(0xffD12525),
          secondary: light.secondary,
          background: light.backgroundColor,
          primary: light.primaryColor,
        ),
        textTheme: lightFonts.textTheme,
      ),
      darkTheme: ThemeData(
        hintColor: dark.hint,
        textTheme: darkFonts.textTheme,
        backgroundColor: dark.backgroundColor,
        colorScheme: const ColorScheme.dark(
          background: dark.backgroundColor,
          secondary: dark.secondary,
          error: dark.error,
          primary: dark.primaryColor,
        ),
      ),
      themeMode: currentTheme.currentTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(
              create: (context) => SignupProvider(),
              child: SignupPage(),
            ),
        '/profile': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => leftSideMenuProvider,
                ),
                ChangeNotifierProvider(
                  create: (context) => ProfileProvider(),
                )
              ],
              child: ProfileScreen(),
            ),
        '/login': (context) => ChangeNotifierProvider(
              create: (context) => LoginProvider(),
              child: LoginPage(),
            ),
        '/home': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => leftSideMenuProvider,
                ),
                ChangeNotifierProvider(
                  create: (context) => HomeProvider(),
                )
              ],
              child: HomePage(),
            ),
        '/search': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => leftSideMenuProvider,
                ),
                ChangeNotifierProvider(
                  create: (context) => SearchProvider(),
                )
              ],
              child: SearchPage(),
            ),
        '/words': (context) => ChangeNotifierProvider(
              create: (context) => wordsProvider,
              child: WordsPage(),
            ),
        '/files': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => FilesProvider(),
                ),
                ChangeNotifierProvider(
                    create: (context) => leftSideMenuProvider),
              ],
              child: FilesScreen(),
            ),
        '/favorite_words': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => FavoriteWordsProvider(),
                ),
                ChangeNotifierProvider(create: (context) => wordsProvider),
              ],
              child: FavoriteWordsScreen(),
            ),
      },
    );
  }
}
