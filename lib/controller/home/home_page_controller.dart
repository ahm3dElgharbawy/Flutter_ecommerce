import 'package:ecommerce/view/screen/favorites/favorites_page.dart';
import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsHomePageController extends GetxController {
  int currentPage = 0;
  List<Widget> pages = const [
    Home(),
    FavoritesPage(),
    Center(child: Text("Messages Page")),
    Settings(),
  ];
  List<Map<String, dynamic>> bottomNavItems = [
    {"label": "Home", "icon": Icons.home_outlined},
    {"label": "Favorite", "icon": Icons.favorite_outline},
    {"label": "Messages", "icon": Icons.message_outlined},
    {"label": "Profile", "icon": Icons.person_outline}
  ];
  changePage(int index);
}

class HomePageController extends AbsHomePageController {
  @override
  changePage(index) {
    currentPage = index;
    update();
  }
}
