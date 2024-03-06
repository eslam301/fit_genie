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
        Get.offAll(() => const SignInPage(),transition: Transition.fadeIn);
      }else{
        Get.offAll(() => const HomeLayout(),transition: Transition.fadeIn);
      }

    });
    return  const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          LogoSplashWidget(),
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
          Text('Version 5.3.1',style: TextStyle(color: Colors.white,fontSize: 10),),
        ],
      ),
    );
  }
}
