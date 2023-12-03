import 'package:fitgenie/pages/sign-in/sign_up/required_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../sign_in.dart';


class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({super.key});
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomTextField(controller: _nameController, label: 'Name',),
                CustomTextField(controller: _emailController, label: 'Email',keyBoardType: TextInputType.emailAddress),
                CustomTextField(controller: _passwordController, label: 'Password',isPassword: true,),
                CustomTextField(controller: _passwordConfirmController, label: 'Confirm Password',isPassword: true,),
                CustomButton(label: 'Sign Up', onTap: () {
                  Get.to(() =>  RequiredForm(),transition: Transition.downToUp,);
                }),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignInPage(),transition: Transition.leftToRight,);
                  },
                  child: const Text('Have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}