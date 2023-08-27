import 'package:ecommerce/controller/auth/foreget%20password/reset_password_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/functions/validate_input.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:ecommerce/core/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordController());
    return Scaffold(
      appBar: CustomAuthAppBar(title: "Reset Password".tr),
      body: GetBuilder<ResetPasswordController>(
        builder: (controller) => ViewDataHandler(
          requestStatus: controller.status,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: controller.formKey,
              child: ListView(children: [
                CustomAuthHeader(
                    title: "New Password".tr,
                    body: "Enter the new password and confirm it".tr),
                const SizedBox(height: 30),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) => CustomTextField(
                    label: "Password".tr,
                    hint: "Enter the new password".tr,
                    icon: const Icon(Icons.lock_outline),
                    controller: controller.password,
                    obscureText: controller.isTextOneHidden,
                    validator: (String? val) {
                      return validateInput(val!, 8, 16, "password");
                    },
                    onIconPressed: () {
                      controller.showOrHide1();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                GetBuilder<ResetPasswordController>(
                  builder: (controller) => CustomTextField(
                    label: "Confirm Password".tr,
                    hint: "Re-enter the new password".tr,
                    icon: const Icon(Icons.lock_outline),
                    controller: controller.confirmPassword,
                    obscureText: controller.isTextTwoHidden,
                    errorMessage: controller.errorMessage,
                    validator: (String? val) {
                      return validateInput(val!, 8, 16, "password");
                    },
                    onIconPressed: () {
                      controller.showOrHide2();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                RoundedButton(
                    title: "Finish".tr,
                    onPressed: () {
                      controller.checkPassword();
                    })
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
