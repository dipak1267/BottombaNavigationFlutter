import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int pageIndex = 0;
  PageController controller = PageController(initialPage: 0);

  void updatePage(int newIndex) {
    pageIndex = newIndex;
    update();
  }

  void nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);

    update();
  }

  void navigateToPage(int index) {
    controller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);

    update();
  }

  void previousPage() {
    controller.previousPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeOut);

    update();
  }
}
