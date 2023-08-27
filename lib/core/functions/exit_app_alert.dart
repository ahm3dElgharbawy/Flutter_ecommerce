import 'dart:io';

import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showExitAlert() {
  return Get.defaultDialog(
      title: "Alert".tr,
      content: Text("Exit from the application".tr),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            ),
            child: Text("Cancel".tr)),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.red,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          ),
          child: Text("Exit".tr),
        ),
      ]);
}
