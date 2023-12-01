import 'package:fitgenie/layout/home_layout.dart';
import 'package:fitgenie/pages/sign-in/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



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
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your email';
                    }else if (!value.contains('@')){
                      return 'Please enter a valid email';
                    }else if(!value.contains('.com')){
                      return 'Please enter a valid email';
                    }else if(value.contains(' ')){
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }else if (value.length < 8){
                      return 'Password must be at least 8 characters';
                    }else if (value.contains(' ')){
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement sign in functionality here
                  Get.to(() =>HomeLayout(),transition: Transition.fadeIn);
                },
                child: const Text('Sign In'),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => SignUpPage(), transition: Transition.rightToLeft);
                },
                child: Text('Create a new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}