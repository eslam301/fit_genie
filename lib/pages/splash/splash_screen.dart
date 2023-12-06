import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sign-in/sign_in.dart';
class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 20;
  double height = 10;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => const SignInPage(),transition: Transition.fadeIn);
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        ),
        child:  Center(
          child: AnimatedContainer( duration: const Duration(milliseconds: 700),
            padding:EdgeInsets.symmetric(horizontal: width,vertical: height) ,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Text(
              'FitGenie',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
                fontFamily: 'Lobster',
                fontStyle: FontStyle.italic,
                shadows: const [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  )
                ]
              )
            ),
          )
        ),
      )
    );
  }
}
