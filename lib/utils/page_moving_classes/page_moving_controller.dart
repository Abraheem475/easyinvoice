import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageMovingController extends GetxController {

  static PageMovingController get instance => Get.find();
  final PageController pageController = PageController();

  Rx<int> currentPageIndex = 0.obs;
  final int totalPages;

  PageMovingController(this.totalPages);

  void updateMovingPageIndicator(int index) => currentPageIndex.value = index;

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void autoScroll() {
    final int currentPage = pageController.page!.toInt();
    final int nextPage = (currentPage + 1) % totalPages;
    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void pressSkipPage() {
    currentPageIndex.value = totalPages - 1;
    pageController.animateToPage(
      totalPages - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

}