import 'package:flutter/material.dart';
import 'package:quranapp1/screens/screenhome.dart';
import 'package:quranapp1/splash.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
             home: Splashscreen(),
          );
        },
      ),
    );
  }
}
