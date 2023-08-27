import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getPublicSnackbar(String title, String body) {
  Get.snackbar(
    title,
    body,
    barBlur: 0,
    colorText: AppColor.white,
    backgroundColor: AppColor.dark,
    padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
  );
}
