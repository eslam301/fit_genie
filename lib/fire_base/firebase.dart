import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../layout/home_layout.dart';
import '../pages/sign-in/sign_in.dart';

authStateChanges(){
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      // print('User is currently signed out!');
    } else {
      // print('User is signed in!');
    }
  });
  FirebaseAuth.instance
      .idTokenChanges()
      .listen((User? user) {
    if (user == null) {
      // print('User is currently signed out!');
    } else {
      // print('User is signed in!');
    }
  });
  FirebaseAuth.instance
      .userChanges()
      .listen((User? user) {
    if (user == null) {
      // print('User is currently signed out!');
    } else {
      // print('User is signed in!');
    }
  });
}

void signInFireBase(emailController, passwordController) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );

    Get.offAll(() => const HomeLayout(),transition: Transition.rightToLeft);
    Get.snackbar('Welcome', credential.user?.displayName ?? 'couch');
  } on FirebaseAuthException catch (e) {
    if (e == 'The supplied auth credential is incorrect, malformed or has expired') {
      Get.snackbar(
        'Error',
        'No user found for that email',
      );
    } else if (e.code == 'wrong-password') {
      Get.snackbar(
        'Error',
        'Wrong password provided for that user.',
      );
    }else if (e.message == 'The supplied auth credential is incorrect, malformed or has expired.'){
      Get.snackbar(
        'Error',
        'Wrong password or email.',
      );
    }else if (e.code == 'user-disabled'){
      Get.snackbar(
        'Error',
        'User disabled',
      );
    }else if (e.code =='too-many-requests'){
      Get.snackbar(
        'Error',
        'Too many requests',
      );
    }else {
      Get.snackbar('Error', e.toString());
      print ('${e.toString()} \t = e');
      print (' ${e.code.toString()}\t = e.credential');
      print (' ${e.message.toString()}\t = e.message');
      print (' ${e.stackTrace.toString()}\t = e.stackTrace');

    }
  }
}
// signOutFireBase()
void signOutFireBase() async {
  await FirebaseAuth.instance.signOut();
}
void saveToFireBase(emailController, passwordController) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    // print(credential.user?.uid);
    // print(credential.user?.email);
    Get.snackbar(
      'Success',
      'Account created successfully',
    );
    Get.to(() => const SignInPage(),transition: Transition.leftToRight);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      // print('The account already exists for that email.');
    } else if (e.code== 'invalid-email'){
      // print('The email is invalid.');
    } else {
      // print('\n\n ${e.code}\n\n');
    }
  } catch (e) {
    // print(e);
  }
}

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