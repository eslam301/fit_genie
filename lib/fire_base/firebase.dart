import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:get/get.dart';

import '../layout/home_layout.dart';

class ApplicationFirebaseAuth extends GetxController {
  static final currentUser = FirebaseAuth.instance.currentUser;
  static User? user;
  static void signInWithGoogle() {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      FirebaseAuth.instance.signInWithProvider(googleAuthProvider);
    } catch (e) {
      // print('------------------------------------------------------');
      // print(e);
      // print('------------------------------------------------------');
    }
  }

  static void signInFireBase(emailController, passwordController) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
      Get.snackbar('Welcome', credential.user?.displayName ?? 'couch');
    } on FirebaseAuthException catch (e) {
      if (e.code ==
          'The supplied auth credential is incorrect, malformed or has expired') {
        Get.snackbar(
          'Error',
          'No user found for that email',
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
        );
      } else if (e.message ==
          'The supplied auth credential is incorrect, malformed or has expired.') {
        Get.snackbar(
          'Error',
          'Wrong password or email.',
        );
      } else if (e.code == 'user-disabled') {
        Get.snackbar(
          'Error',
          'User disabled',
        );
      } else if (e.code == 'too-many-requests') {
        Get.snackbar(
          'Error',
          'Too many requests',
        );
      } else {
        Get.snackbar('Error', e.toString());
        // print ('${e.toString()} \t = e');
        // print (' ${e.code.toString()}\t = e.credential');
        // print (' ${e.message.toString()}\t = e.message');
        // print (' ${e.stackTrace.toString()}\t = e.stackTrace');
      }
    }
  }

  Stream<void> get onAuthStateChanged {
    return FirebaseAuth.instance.authStateChanges();
  }

  static void signUp({
    required String email,
    required String password,
  }) {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
      }else {
        Get.snackbar('Error', e.toString());
      }
    }
  }

  static void signOutFireBase() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const SignInLayout(), transition: Transition.rightToLeft);
    Get.snackbar('Sign out', 'Sign out successful');
  }
  static User? getUserData() {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }
}
