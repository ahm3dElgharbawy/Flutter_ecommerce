import 'package:ecommerce/core/functions/fcm.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices services = Get.find();

  changeLanguage(String langCode) {
    services.prefs.setString("lang", langCode);
    Get.updateLocale(Locale(langCode));
  }

  @override
  void onInit() {
    requestPermission();
    listenMessage();
    String? current = services.prefs.getString("lang");
    if (current == "ar") {
      language = const Locale("ar");
    } else if (current == "en") {
      language = const Locale("en");
    } else {
      language = Get.deviceLocale;
    }
    super.onInit();
  }
}
