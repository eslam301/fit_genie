
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
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {


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
          child: Icon(
            themeController.isDarkMode.value
                ? Icons.dark_mode
                : Icons.light_mode,
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
                Form(
                  key: signInFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        label: 'Email',
                        keyBoardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        label: 'Password',
                        isPassword: true,
                        keyBoardType: TextInputType.visiblePassword,
                         validator: (String? value) {
                           if (value == null || value.isEmpty) {
                             return 'Please enter your password';
                           } else {
                             return null;
                           }
                         },
                      ),

                      LongButton(
                        label: 'Sign In',
                        onTap: () {
                          signIn(signInFormKey);
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAll(() => const SignUpPage(),
                              transition: Transition.rightToLeft);
                        },
                        child: const Text(
                          'Create a new account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn( signInFormKey ) {
    if (signInFormKey.currentState!.validate()) {
      Get.to(() => const HomeLayout(),transition: Transition.rightToLeft);
    } else {
      Get.snackbar(
        'Error',
        'Please enter valid email and password',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.error, color: Colors.white),
        margin: const EdgeInsets.only(bottom: 5, left: 0, right: 0),
        borderRadius: 15,
      );
    }
  }
}
