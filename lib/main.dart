import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:fitgenie/pages/News/news_screen.dart';
import 'package:fitgenie/pages/food/food_view.dart';
import 'package:fitgenie/pages/settings/setting_view.dart';
import 'package:fitgenie/pages/splash/splash_screen.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'core/application_theme.dart';
import 'core/provider/app_provider.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,

    ]);

    return GetMaterialApp(
      title: 'FitGenie',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: BindingsBuilder(() {
        Get.put(AppProvider());
        Get.put(ThemeController());
      }),
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
        GetPage(name: SignInLayout.routeName, page: () => const SignInLayout()),
        GetPage(name: HomeLayout.routeName, page: () => const HomeLayout()),
        GetPage(name: NewsView.routeName, page: () => const NewsView()),
        GetPage(name: FoodPlanView.routeName, page: () => const FoodPlanView()),
        GetPage(name: WorkOutPlanView.routeName, page: () => const WorkOutPlanView()),
        GetPage(name: SettingsView.routeName, page: () => const SettingsView()),
      ],
      transitionDuration: const Duration(milliseconds: 400),
      defaultTransition: Transition.rightToLeft,
    );
  }
}

