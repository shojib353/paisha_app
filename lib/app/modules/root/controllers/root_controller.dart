import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../home/views/home_view.dart';

class RootController extends GetxController {
  var currentIndex = 0.obs;

  final pages = [
    const HomeView(),
   Center(child: Text("data"),),
    Center(child: Text("data"),),
    Center(child: Text("data"),),
    Center(child: Text("data"),)
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}