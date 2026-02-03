import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingData> pages = [

    OnboardingData(
      title: 'Financial monitoring',
      description: 'Keep your incomes and expenses on track',
      imagePath: 'assets/icons/financial-statement.png',
    ),
    OnboardingData(
      title: 'Expenses category',
      description: 'Category make it easier to track and monitor your spending',
      imagePath: 'assets/icons/evaluation.png',
    ),
    OnboardingData(
      title: 'Saving Goals',
      description: 'Set your first savings goal and track the savings progress',
      imagePath: 'assets/icons/financial-services.png',
    ),
    OnboardingData(
      title: 'Budget Control',
      description: 'Add a budget to control your spending',
      imagePath: 'assets/icons/accounting.png',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    Get.offAllNamed('/registration');
  }

  void restoreData() {
    // Handle restore data
    Get.snackbar(
      'Restore',
      'Restore data functionality',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}

// ============================================
// models/onboarding_data.dart
// ============================================

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
