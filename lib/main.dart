import 'package:fitgenie/pages/sign-in/sign_in.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:fitgenie/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/application_theme.dart';
import 'layout/home_layout.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) =>  SignUpPage(),
        HomeLayout.routeName: (context) =>  HomeLayout(),
      },
      transitionDuration: const Duration(milliseconds: 1500),
    );
  }

}

