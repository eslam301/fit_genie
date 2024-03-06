import 'package:fitgenie/pages/premium/premium_plans_view.dart';
import 'package:fitgenie/pages/profile/profile_view.dart';
import 'package:fitgenie/pages/sign-in/sign_in.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:fitgenie/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/application_theme.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FitGenie',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
      }),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        ProfilePage.routeName: (context) =>  const ProfilePage(),
        PremiumPlansView.routeName: (context) => const PremiumPlansView(),
      },
      transitionDuration: const Duration(milliseconds: 1650),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
class ThemeController extends GetxController {
   late String currentTheme = 'Default';
  RxBool isDarkMode = false.obs;
  ThemeData get themeData => isDarkMode.value ? ThemeData.dark() : ThemeData.light();
  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
  void changeTheme(String theme) {
    Get.changeThemeMode(theme == "Dark" ? ThemeMode.dark : ThemeMode.light);
    currentTheme = theme;
    update();
  }


}
