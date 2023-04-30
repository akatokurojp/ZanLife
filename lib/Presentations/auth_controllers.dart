import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts/Presentations/home_page_screens/home_page.dart';
import 'package:uts/Presentations/login_page/login_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class AuthController extends GetxController {
  // sign up text editing controllers

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // forgor email controller

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createAccount() async {
    if (passwordConfirmed()) {
      final user = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final firestore = FirebaseFirestore.instance;
      firestore.collection('users').doc(user.user!.uid).set(
          {"email": emailController.text, "password": passwordController.text});
      if (user != null) {
        Get.to(LoginPage());
      } else {
        print('error');
      }
    }
  }

  Future<void> loginUser() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    try {
      if (user != null) {
        // lets save user with shared prefrences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userID", user.user!.uid);
        print(user.user!.uid);
        Get.to(HomePage());
        Get.snackbar(
          'Account Logged in',
          'Welcome Back',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Signing Account',
        e.toString(),
      );
    }
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginPage());
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
}
