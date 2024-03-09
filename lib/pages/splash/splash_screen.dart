import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/logo_splash_widget.dart';
import '../../layout/home_layout.dart';
import '../sign-in/sign_in.dart';
class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == null){
        Get.offNamed(SignInPage.routeName);
      }else{
        Get.offNamed(HomeLayout.routeName);
      }
    });
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          FadeIn(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 1200),
              child: const LogoSplashWidget()),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
          const Text('Version 5.4.1',style: TextStyle(color: Colors.white,fontSize: 10),),
        ],
      ),
    );
  }
}
