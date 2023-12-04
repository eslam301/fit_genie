import 'package:flutter/material.dart';

class ApplicationTheme{
  static Color primaryColor = const Color(0xffFFBB3B);
  static Color secondaryColor = const Color(0xff504f4f);
  static Color textColor = const Color(0xff121312);
  static Color backgroundColor = const Color(0xff343534);
  static Color errorColor = const Color(0xffFF0000);
  static Color successColor = const Color(0xff00B418);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 30,
      ),

      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
    ),
    textTheme: const TextTheme(),
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: textColor,

      secondary: secondaryColor,
      onSecondary: Colors.black,
      error: errorColor,
      onError: Colors.red,
      background: backgroundColor,
      onBackground: Colors.pink,
      surface: Colors.blue,
      onSurface: Colors.pinkAccent,
      brightness: Brightness.dark

    ),
    scaffoldBackgroundColor: backgroundColor,
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      backgroundColor:backgroundColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor:primaryColor,
      unselectedItemColor:Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}