import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ControllerBottomNav extends GetxController {
  //on this project using Getx simple stateManagement
  int currentPage = 0;
  var pageController = PageController();

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //Create method OnTap BottomNavbar to different page or screen
  void goToTap(int page) {
    currentPage = page;
    pageController.jumpToPage(page);
    update(); //update ui with getx simple state;
  }

  //Create animaion on pageview
  void animtationOnTap(int page) {
    currentPage = page;
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
    update();
  }
}
