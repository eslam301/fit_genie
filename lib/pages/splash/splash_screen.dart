
import 'package:fitgenie/pages/sign-in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
       Get.to(() => const SignInPage(),transition: Transition.fadeIn);
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00B418),
              Color(0xff000000),
            ]
          )
        ),
        child: const Center(
          child: Text(
            'FitGenie',
          )
        )
      )
    );
  }
}
