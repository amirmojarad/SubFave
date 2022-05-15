import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subfave/controllers/home.dart';
import 'package:subfave/controllers/login.dart';
import 'package:subfave/controllers/signup.dart';
import 'package:subfave/screens/auth/login/login.dart';
import 'package:subfave/screens/auth/signup/signup.dart';
import 'package:subfave/screens/common/scroll.dart';
import 'package:subfave/screens/config.dart';
import 'package:subfave/screens/home/home.dart';

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
        errorColor: const Color(0xffD12525),
        backgroundColor: const Color(0xff1B4332),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xff70DD45),
        ),
        colorScheme: const ColorScheme.light(
          
          background: Color(0xffD8F3DC),
          primary: Color(0xff1B4332),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xff1B4332),
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
          headlineSmall: TextStyle(
            color: Color(0xff1B4332),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          headlineLarge: TextStyle(
            color: Color(0xff1B4332),
            fontWeight: FontWeight.w900,
            fontSize: 26,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
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
              child:  HomePage(),
            )
      },
    );
  }
}
