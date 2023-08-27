import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAuthForgetPassword extends GetView<LoginController> {
  const CustomAuthForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GetBuilder<LoginController>(
                    builder: (controller) => Checkbox(
                        value: controller.isChecked,
                        // checkColor: Colors.blue,
                        checkColor: AppColor.white,
                        activeColor: AppColor.blue,
                        onChanged: (val) {
                          controller.changeCheckBoxState();
                        }),
                  ),
                  Text("Remember me".tr),
                ],
              ),
              TextButton(
                onPressed: () {
                  controller.toForgetPassword();
                },
                child: Text(
                  "Forgot Password".tr,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          );
  }
}