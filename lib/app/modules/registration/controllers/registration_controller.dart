import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Text editing controllers
  final nameController = TextEditingController();
  final emailOrPhoneController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable variables
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailOrPhoneController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate form
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'নাম লিখুন';
    }
    return null;
  }

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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'পাসওয়ার্ড নিশ্চিত করুন';
    }
    if (value != newPasswordController.text) {
      return 'পাসওয়ার্ড মিলছে না';
    }
    return null;
  }

  // Registration method
  Future<void> register() async {
    if (nameController.text.isEmpty ||
        emailOrPhoneController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'ত্রুটি',
        'সকল তথ্য পূরণ করুন',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'ত্রুটি',
        'পাসওয়ার্ড মিলছে না',
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
      'রেজিস্ট্রেশন সম্পন্ন হয়েছে',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate to next screen or clear form
    clearForm();
  }

  // Clear form
  void clearForm() {
    nameController.clear();
    emailOrPhoneController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}