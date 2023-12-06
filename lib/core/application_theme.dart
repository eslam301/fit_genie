import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xffE9A6A6);
  static Color primaryColor2 = const Color(0xff3F3351);
  static Color secondaryColor = const Color(0xff864879);
  static Color textColor1 = const Color(0xffffffff);
  static Color textColor = const Color(0xff121312);
  static Color backgroundColor = const Color(0xff1F1D36);
  static Color errorColor = const Color(0xffFF0000);
  static Color successColor = const Color(0xff00B418);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: textColor1,
        size: 30,
      ),
      titleTextStyle: TextStyle(
        color: textColor1,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(),
    colorScheme: ColorScheme(
        primary: primaryColor,
        onPrimary: textColor,
        secondary: secondaryColor,
        onSecondary: primaryColor2,
        error: errorColor,
        onError: Colors.red,
        background: backgroundColor,
        onBackground: Colors.pink,
        surface: Colors.blue,
        onSurface: Colors.pinkAccent,
        brightness: Brightness.dark),
    scaffoldBackgroundColor: backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white,
      selectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
