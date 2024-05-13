import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:get/get.dart';

import '../layout/home_layout.dart';

class ApplicationFirebaseAuth extends GetxController {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final currentUser = auth.currentUser;
  static User? user;
  static void signInWithGoogle() {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      auth.signInWithProvider(googleAuthProvider);
    } catch (e) {
      // print('------------------------------------------------------');
      // print(e);
      // print('------------------------------------------------------');
    }
  }
  static void signInFireBase(emailController, passwordController) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
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
    return auth.authStateChanges();
  }

  // static  authStateChanges()  async {
  //   auth.authStateChanges().listen((event) {
  //     user = event;
  //     print(user);
  //     if (user == null) {
  //       Get.offAll(() => const HomeLayout(),
  //           transition: Transition.rightToLeft);
  //     } else {
  //       Get.offAll(() => const HomeLayout(),
  //           transition: Transition.rightToLeft);
  //     }
  //   });
  //   auth.idTokenChanges().listen((User? user) {
  //     if (user == null) {
  //       Get.offAll(() => const SignInLayout(),
  //           transition: Transition.rightToLeft);
  //     } else {
  //       Get.offAll(() => const HomeLayout(),
  //           transition: Transition.rightToLeft);
  //     }
  //   });
  //   auth.userChanges().listen((User? user) {
  //     if (user == null) {
  //       Get.offAll(() => const SignInLayout(),
  //           transition: Transition.rightToLeft);
  //     } else {
  //       Get.offAll(() => const HomeLayout(),
  //           transition: Transition.rightToLeft);
  //     }
  //   });
  // }

  static void signOutFireBase() async {
    await auth.signOut();
    Get.offAll(() => const SignInLayout(), transition: Transition.rightToLeft);
    Get.snackbar('Sign out', 'Sign out successful');
  }

  static Future saveSignToFireBase(
      {required String emailController,
      required String passwordController,
      required String nameController}) async {
    try {

      auth.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const GetSnackBar(
          title: 'error',
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        const GetSnackBar(
          title: 'error',
          message: 'The account already exists for that email.',
        );
      } else if (e.code == 'invalid-email') {
        const GetSnackBar(
          title: 'error',
          message: 'The email address is badly formatted.',
        );
      } else if (e.code == 'operation-not-allowed') {
        const GetSnackBar(
          title: 'error',
          message: 'Operation not allowed. Please contact support.',
        );
      }
    } catch (e) {
      const GetSnackBar(
        title: 'error',
        message: 'Something went wrong 2',
      );
    }
  }

  static User? getUserData() {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }
}

// signOutFireBase()

// signUpFireBase()
// saveSignToFireBase()

// void get userData async {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     // Name, email address, and profile photo URL
//     final name = user.displayName;
//     final email = user.email;
//     final photoUrl = user.photoURL;
//     // Check if user's email is verified
//     final emailVerified = user.emailVerified;
//     // The user's ID, unique to the Firebase project. Do NOT use this value to
//     // authenticate with your backend server, if you have one. Use
//     // User.getIdToken() instead.
//     final uid = user.uid;
//   }
// }
