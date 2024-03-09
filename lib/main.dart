import 'package:fitgenie/pages/notification/notification_view.dart';
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
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(name: SignInPage.routeName, page: () => const SignInPage()),
        GetPage(name: SignUpPage.routeName, page: () => const SignUpPage()),
        GetPage(name: HomeLayout.routeName, page: () => const HomeLayout()),
        GetPage(name: ProfilePage.routeName, page: () => const ProfilePage()),
        GetPage(name: PremiumPlansView.routeName, page: () => const PremiumPlansView()),
        GetPage(name: NotificationView.routeName, page: () => NotificationView()),
      ],
      transitionDuration: const Duration(milliseconds: 550),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
class ThemeController extends GetxController {
  late String currentTheme = 'Default';
  RxBool isDarkMode = false.obs;
  ThemeData get themeData => Get.isDarkMode ? ThemeData.dark() : ThemeData.light();

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
