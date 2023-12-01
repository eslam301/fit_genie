import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:fitgenie/layout/home_layout.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  const SignInPage({super.key});
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(controller: _emailController, label: 'Email',keyBoardType: TextInputType.emailAddress,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextField(controller: _passwordController, label: 'Password',isPassword: true,),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement sign in functionality here
                  Get.to(() =>const HomeLayout(),transition: Transition.fadeIn);
                },
                child: const Text('Sign In'),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const SignUpPage(), transition: Transition.rightToLeft);
                },
                child: const Text('Create a new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}