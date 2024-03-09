
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../fire_base/firebase.dart';
import '../sign_in.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({super.key});
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      controller: _nameController,
                      label: 'Name',
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      }),
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
                      }),
                  CustomTextField(
                      controller: _passwordController,
                      label: 'Password',
                      isPassword: true,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        } else if (!value.contains(RegExp(r'[a-z]'))) {
                          return 'Password must contain at least one lowercase letter';
                        } else {
                          return null;
                        }
                      }),
                  CustomTextField(
                      controller: _passwordConfirmController,
                      label: 'Confirm Password',
                      isPassword: true,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }else {
                          return 'error';
                        }
                      }),
                  LongButton(
                      label: 'Sign Up',
                      onTap: () {
                        signUp();
                      }),
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => const SignInPage(),transition: Transition.leftToRight);
                    },
                    child: const Text(
                      'Have an account? \t Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //         padding: const EdgeInsets.all(15),
                  //         decoration: BoxDecoration(
                  //           color: theme.primaryColor,
                  //           borderRadius: BorderRadius.circular(10),
                  //
                  //         ),
                  //         child: const Text(
                  //           'Sign up as a \ncouch',
                  //           style: TextStyle(color: Colors.white,fontSize: 24),
                  //           textAlign: TextAlign.center,
                  //         )
                  //     ),
                  //     Container(
                  //         padding: const EdgeInsets.all(15),
                  //         decoration: BoxDecoration(
                  //           color: theme.primaryColor,
                  //           borderRadius: BorderRadius.circular(10),
                  //
                  //         ),
                  //         child: const Text(
                  //           'Sign up as a \n trainer',
                  //           style: TextStyle(color: Colors.white,fontSize: 24),
                  //           textAlign: TextAlign.center,
                  //
                  //         )
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    if (signUpFormKey.currentState!.validate()) {
      // print('Validated');
      // print('Email: ${_emailController.text}');
      // print('Password: ${_passwordController.text}');
      // print('Name: ${_nameController.text}\n --------------------------------');
      //Get.to(() => RequiredForm(),transition: Transition.leftToRight);
      saveToFireBase(_emailController.text, _passwordController.text,);
    } else {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
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
