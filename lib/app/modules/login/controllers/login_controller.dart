import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Text editing controllers
  late final TextEditingController emailOrPhoneController;
  late final TextEditingController passwordController;

  // Observable variables
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrPhoneController = TextEditingController();
    passwordController = TextEditingController();
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

  // Login method
  Future<void> login() async {
    if (emailOrPhoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
      'লগইন সফল হয়েছে',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate to next screen
    Get.offAllNamed('/root');
  }


}