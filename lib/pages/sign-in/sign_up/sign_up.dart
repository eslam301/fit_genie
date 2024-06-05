import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/pages/sign-in/sign_up/required_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/logo_splash_widget.dart';
import '../../../layout/basic_layout_page.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({super.key});
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: signUpFormKey,
          child: Column(
            children: [
              // FadeIn(
              //   delay: const Duration(milliseconds: 100),
              //   child: const Text(
              //     'Sign Up',
              //     style: TextStyle(
              //       fontSize: 38,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              FadeInDown(
                  duration: const Duration(milliseconds: 700),
                  child: const LogoSplashWidget()),
              const SizedBox(height: 20),
              // CustomTextField(
              //     keyboardType: TextInputType.name,
              //     suffixIcon: const Icon(Icons.person),
              //     delay: const Duration(milliseconds: 50),
              //     controller: nameController,
              //     label: 'Name',
              //     validator: (String? value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter your name';
              //       } else {
              //         //print('name is valid');
              //         return null;
              //       }
              //     }),
              CustomTextField(
                  controller: emailController,
                  delay: const Duration(milliseconds: 100),
                  suffixIcon: const Icon(Icons.email),
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    } else {
                      //print('email is valid');
                      return null;
                    }
                  }),
              CustomTextField(
                  controller: passwordController,
                  delay: const Duration(milliseconds: 150),
                  label: 'Password',
                  isPassword: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  }),
              CustomTextField(
                  controller: passwordConfirmController,
                  delay: const Duration(milliseconds: 200),
                  label: 'Confirm Password',
                  isPassword: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    } else {
                      return null;
                    }
                  }),
              FadeInUp(
                delay: const Duration(milliseconds: 350),
                child: LongButton(
                    label: 'Sign Up',
                    onTap: () {
                      _signUp();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async{
    if (signUpFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Get.snackbar(
          'Success',
          'Account created successfully',
        );
        Get.to(
          const LayOutPageView(
            appBarTitle: 'Required Form',
            body: RequiredForm(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar(
            'Error',
            'The password provided is too weak.',
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            'Error',
            'The account already exists for that email.',
          );
        } else {
          Get.snackbar('Error', e.toString());
        }
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        colorText: Colors.white,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.error, color: Colors.white),
        margin: const EdgeInsets.only(bottom: 5, left: 0, right: 0),
        borderRadius: 15,
      );
    }
  }
}
