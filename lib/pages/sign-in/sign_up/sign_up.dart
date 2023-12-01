import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../sign_in.dart';


class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextField(controller: _nameController, label: 'Name',),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextField(controller: _emailController, label: 'Email',),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextField(controller: _passwordController, label: 'Password',),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextField(controller: _passwordConfirmController, label: 'Confirm Password',),
              ),

              ElevatedButton(
                onPressed: () {
                  // Implement sign up functionality here
                },
                child: Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const SignInPage(),transition: Transition.leftToRight,);
                },
                child: Text('Have an account? Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}