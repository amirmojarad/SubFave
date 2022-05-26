import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/home.dart';
import 'package:subfave/controllers/login.dart';
import 'package:subfave/controllers/search_movie.dart';
import 'package:subfave/controllers/signup.dart';
import 'package:subfave/screens/auth/login/login.dart';
import 'package:subfave/screens/auth/signup/signup.dart';
import 'package:subfave/screens/common/scroll.dart';
import 'package:subfave/screens/config.dart';
import 'package:subfave/screens/home/home.dart';
import 'package:subfave/screens/search/search.dart';
import 'package:subfave/screens/theme/dark/dark_theme.dart' as dark;
import 'package:subfave/screens/theme/light/light_theme.dart' as light;
import 'package:subfave/screens/theme/light/fonts.dart' as lightFonts;
import 'package:subfave/screens/theme/dark/fonts.dart' as darkFonts;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: light.backgroundColor,
        hintColor: light.hint,
        dividerColor: light.divider,
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
        '/login': (context) => ChangeNotifierProvider(
              create: (context) => LoginProvider(),
              child: LoginPage(),
            ),
        '/home': (context) => ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              child: HomePage(),
            ),
        '/search': (context) => ChangeNotifierProvider(
              create: (context) => SearchProvider(),
              child: SearchPage(),
            ),
          
      },
    );
  }
}
