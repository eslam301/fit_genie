import 'package:flutter/material.dart';

class ApplicationTheme{
  static Color primaryColor = const Color(0xff00B418);
  static Color secondaryColor = const Color(0xff000000);
  static Color textColor = const Color(0xff000000);
  static Color backgroundColor = const Color(0xee212121);
  static Color errorColor = const Color(0xffFF0000);
  static Color successColor = const Color(0xff00B418);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    appBarTheme:  AppBarTheme(

      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),

      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
    ),
    textTheme: const TextTheme(

    ),
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