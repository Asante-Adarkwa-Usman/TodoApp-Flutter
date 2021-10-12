import 'package:flutter/material.dart';
import 'package:todo_app/views/home_view.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        shadowColor: Colors.white38,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(249, 251, 255, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: customBlue,
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(
            color: customBlue,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        shadowColor: Colors.black38,
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: customBlue,
            fontSize: 21.0,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(
            color: customBlue,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
