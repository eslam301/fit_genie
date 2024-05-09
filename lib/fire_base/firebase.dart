import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:get/get.dart';

import '../layout/home_layout.dart';

authStateChanges() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      Get.offAll(() => const SignInLayout(),
          transition: Transition.rightToLeft);
    } else {
      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
    }
  });
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      Get.offAll(() => const SignInLayout(),
          transition: Transition.rightToLeft);
    } else {
      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
    }
  });
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      Get.offAll(() => const SignInLayout(),
          transition: Transition.rightToLeft);
    } else {
      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
    }
  });
}

void signInFireBase(emailController, passwordController) async {
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

class GoogleAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? user;
  static void signInWithGoogle() {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
    } catch (e) {
      print('------------------------------------------------------');
      print(e);
      print('------------------------------------------------------');
    }
    if (user != null) {
      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
      Get.snackbar(
        'Welcome',
        user?.displayName?? 'couch',
      );
    }
  }
}

// signOutFireBase()
void signOutFireBase() async {
  await FirebaseAuth.instance.signOut();
  Get.offAll(() => const SignInLayout(), transition: Transition.rightToLeft);
}

// signUpFireBase()
// saveSignToFireBase()
Future saveSignToFireBase(
    {required String emailController,
    required String passwordController,
    required String nameController}) async {
  try {
    final credential = FirebaseAuth.instance.createUserWithEmailAndPassword(
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
