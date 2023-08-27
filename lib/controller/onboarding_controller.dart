import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsOnBoardingController extends GetxController {
  int currentPage = 0;
  late PageController pageController;
  MyServices services = Get.find();
  next();
  onPageChanged(int index);
}

class OnBoardingController extends AbsOnBoardingController {
  @override
  next() {
    currentPage++;
    if (currentPage >= appBoardingList.length) {
      services.prefs.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
