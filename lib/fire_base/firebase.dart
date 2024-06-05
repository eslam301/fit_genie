import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../layout/home_layout.dart';
class ApplicationFirebaseAuth extends GetxController {
  static final currentUser = FirebaseAuth.instance.currentUser;
  static User? user;
  static Future<void> signInWithGoogle() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      FirebaseAuth.instance.signInWithProvider(googleAuthProvider);
    } catch (e) {
      // print('------------------------------------------------------');
      // print(e);
      // print('------------------------------------------------------');
    }
  }

  static Future<void> signInFireBase(
      emailController, passwordController) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.offAll(() => const HomeLayout(), transition: Transition.rightToLeft);
      Get.snackbar('Welcome', credential.user?.displayName ?? '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
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

  static Future<void> signUp({
    required String email,
    required String password,
  }) async {
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
      } else {
        Get.snackbar('Error', e.toString());
      }
    }
  }

  static Future<void> signOutFireBase() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const SignInLayout(), transition: Transition.rightToLeft);
    Get.snackbar('Sign out', 'Sign out successful');
  }

  static User? getUserData() {
    final user = FirebaseAuth.instance.currentUser;
    return user;
  }
}

Future<void> createUserDataToFireStore({
  required String firstName,
  required String secondName,
  required String age,
  required String weight,
  required String height,
  required String gender,
  required String disease,
}) async {
  CollectionReference usersData = FirebaseFirestore.instance.collection('usersData');
  try {
    await usersData.add({
      'firstName': firstName,
      'secondName': secondName,
      'email': FirebaseAuth.instance.currentUser?.email,
      'age': int.parse(age), // Ensure age is parsed to int if it's numerical
      'weight': double.parse(weight), // Ensure weight is parsed to double if it's numerical
      'height': double.parse(height), // Ensure height is parsed to double if it's numerical
      'gender': gender,
      'disease': disease,
      'documentID': usersData.doc().id, // You can update this later after getting the document ID
      'UserID': FirebaseAuth.instance.currentUser?.uid,
    }).then((value) {
      // Update the document with its ID
      value.update({'documentID': value.id});
      print("User Added");
    }).catchError((error) => print("Failed to add user: $error"));
  } catch (error) {
    print('Error creating user data: $error');
    // Handle the error accordingly
  }
}

Future<void> updateUserDataToFireStore({
  required String firstName,
  required String secondName,
  required String email,
  required String age,
  required String weight,
  required String height,
  required String gender,
  required String disease,
}) async {
  try {
    CollectionReference usersData = FirebaseFirestore.instance.collection('usersData');
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await usersData.where('email', isEqualTo: user.email).get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.first.reference.update({
          'firstName': firstName.isEmpty ? querySnapshot.docs.first['firstName'] : firstName,
          'secondName': secondName.isEmpty ? querySnapshot.docs.first['secondName'] : secondName,
          'email': email.isEmpty ? querySnapshot.docs.first['email'] : email,
          'age': int.parse(age.isEmpty ? querySnapshot.docs.first['age'].toString() : age), // Corrected to match the parameter type
          'weight': double.parse(weight.isEmpty ? querySnapshot.docs.first['weight'].toString() : weight), // Corrected to match the parameter type
          'height': double.parse(height.isEmpty ? querySnapshot.docs.first['height'].toString() : height), // Corrected to match the parameter type
          'gender': gender.isEmpty ? querySnapshot.docs.first['gender'] : gender,
          'disease': disease.isEmpty ? querySnapshot.docs.first['disease'] : disease,
        });
        print('User data updated successfully.');
      } else {
        print('User data not found.');
      }
    } else {
      print('User not authenticated.');
    }
  } catch (error) {
    print('Error updating user data: $error');
    // Handle the error accordingly
  }
}

Future<void> deleteUserDataFromFireStore() async {
  try {
    CollectionReference usersData = FirebaseFirestore.instance.collection('usersData');
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await usersData.where('email', isEqualTo: user.email).get();
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.where((element) => element['UserID'] == user.uid).first.reference.delete();
        print('User data deleted successfully.');
      } else {
        print('User data not found.');
      }
    } else {
      print('User not authenticated.');
    }
  } catch (error) {
    print('Error deleting user data: $error');
    // Handle the error accordingly
  }
}



//get user data -------------------------------------------------------------------------------------
Future<void> getUserDataFromFireStoreByEmail(
{
  required String email
}
    )async {

  CollectionReference usersData = FirebaseFirestore.instance.collection('usersData');
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    QuerySnapshot querySnapshot = await usersData.where('email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      final pref = await SharedPreferences.getInstance();
      await pref.setString('firstName', querySnapshot.docs.first['firstName']);
      await pref.setString('secondName', querySnapshot.docs.first['secondName']);
      await pref.setString('email', querySnapshot.docs.first['email']);
      await pref.setString('age', querySnapshot.docs.first['age'].toString());
      await pref.setString('weight', querySnapshot.docs.first['weight'].toString());
      await pref.setString('height', querySnapshot.docs.first['height'].toString());
      await pref.setString('gender', querySnapshot.docs.first['gender']);
      await pref.setString('disease', querySnapshot.docs.first['disease']);
      print('User data retrieved successfully for: $email , ${querySnapshot.docs.first['email']}');
    } else {
      print('User data not found.');
    }
  } else {
    print('User not authenticated.');
  }
}
