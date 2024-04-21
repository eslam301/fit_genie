import 'package:fitgenie/pages/News/news_screen.dart';
import 'package:fitgenie/pages/notification/notification_view.dart';
import 'package:fitgenie/pages/profile/profile_view.dart';
import 'package:fitgenie/pages/sign-in/sign_in.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:fitgenie/pages/splash/splash_screen.dart';
// import 'package:fitgenie/pages/timer/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'core/application_theme.dart';
import 'core/provider/app_provider.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppProvider();
      },
      child: const MyApp()));
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
        GetPage(name: ProfilePage.routeName, page: () =>  ProfilePage()),
        GetPage(name: NewsScreen.routeName, page: () => const NewsScreen()),
        GetPage(
            name: NotificationView.routeName,
            page: () => const NotificationView()),
      ],
      transitionDuration: const Duration(milliseconds: 400),
      defaultTransition: Transition.rightToLeft,
    );
  }
}
