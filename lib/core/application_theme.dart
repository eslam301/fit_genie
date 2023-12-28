import 'package:flutter/material.dart';

class ApplicationTheme {
  static const Color gothic = Color(0xff254c51);
  static const Color openGothic = Color(0xff6c8589);
  static const Color whiteGothic = Color(0xffcedcdd);
  static const Color white = Color(0xffffffff);
  static const Color darkSlate = Color(0xff000c08);


  static ThemeData lightTheme = ThemeData(
    primaryColor: gothic,
    secondaryHeaderColor: openGothic,
    scaffoldBackgroundColor: openGothic,
    appBarTheme: AppBarTheme(
      backgroundColor: openGothic,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: white,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(),
    colorScheme: ColorScheme(
        primary: gothic,
        onPrimary: openGothic,
        secondary: whiteGothic,
        onSecondary: white,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.pink,
        surface: Colors.blue,
        onSurface: Colors.pinkAccent,
        brightness: Brightness.dark
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: openGothic,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: gothic,
    secondaryHeaderColor: openGothic,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
    )
  );
}
