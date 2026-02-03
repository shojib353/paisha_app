import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Text editing controllers

  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();


  // Observable variables
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {

    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }


  // Validate form


  String? validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'ইমেইল বা মোবাইল নম্বর লিখুন';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'পাসওয়ার্ড লিখুন';
    }
    if (value.length < 6) {
      return 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে';
    }
    return null;
  }



  // Registration method
  Future<void> login() async {
    if (
        emailOrPhoneController.text.isEmpty ||
        passwordController.text.isEmpty ) {
      Get.snackbar(
        'ত্রুটি',
        'সকল তথ্য পূরণ করুন',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }


    isLoading.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.snackbar(
      'সফল',
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate to next screen or clear form
    Get.offAllNamed('/home');
    clearForm();
  }

  // Clear form
  void clearForm() {
    emailOrPhoneController.clear();
    passwordController.clear();

  }
}