import 'dart:io';
import 'package:ecommerce/controller/home/home_page_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/custom_appbar_search.dart';
import 'package:ecommerce/view/widget/home/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return GetBuilder<HomePageController>(
      builder: (controller) => WillPopScope(
        onWillPop: () {
          Get.defaultDialog(
            title: "alert",
            content: const Text("are you want to exit from app"),
            cancel: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("cancel"),
            ),
            confirm: ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
              child: const Text("ok"),
            ),
          );
          return Future.value(false);
        },
        child: Scaffold(
          appBar: controller.currentPage == 0
              ? const CustomAppBarSearch(searchTitle: "Search product")
              : null,
          bottomNavigationBar: const BottomNavBar(),
          body: controller.pages[controller.currentPage],
        ),
      ),
    );
  }
}
