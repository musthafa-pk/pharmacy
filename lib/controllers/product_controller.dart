import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/productModel.dart';


class ProductController extends GetxController {
  final RxInt currentPage = 0.obs;
  var products = <Product>[].obs;
  final PageController pageController = PageController();
  Timer? _autoScrollTimer;

  @override
  void onInit() {
    super.onInit();
    // fetchProducts();
    startAutoScroll();
  }

  void startAutoScroll() {
    _autoScrollTimer =
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        final nextPage = (currentPage.value + 1) % 6;
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        currentPage.value = nextPage;
      }
    });
  }



  void updatePage(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    _autoScrollTimer?.cancel();
    pageController.dispose(); // Dispose of the PageController when done
    super.onClose();
  }
}
