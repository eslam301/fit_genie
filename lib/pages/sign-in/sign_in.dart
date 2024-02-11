import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:fitgenie/core/widgets/logo_splash_widget.dart';
import 'package:fitgenie/layout/home_layout.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_button.dart';
import '../../main.dart';



class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  const SignInPage({super.key});
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            themeController.toggleTheme();
          },
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          elevation: 10,
          highlightElevation: 0,
          hoverElevation: 0,
          child:Icon(
            themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            size: 24,
          ),

        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const LogoSplashWidget(),
                const SizedBox(height: 20),
                CustomTextField(controller: _emailController, label: 'Email',keyBoardType: TextInputType.emailAddress,),
                CustomTextField(controller: _passwordController, label: 'Password',isPassword: true,keyBoardType: TextInputType.visiblePassword,),
                LongButton(label: 'Sign In',
                    onTap: () {
                  Get.offAll(() => const HomeLayout(),transition: Transition.fadeIn,);
                }),
                TextButton(
                  onPressed: () {
                    Get.offAll(() => const SignUpPage(), transition: Transition.rightToLeft);
                  },
                  child: const Text('Create a new account',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}