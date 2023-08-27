import 'package:ecommerce/controller/auth/foreget%20password/forget_password_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/functions/validate_input.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:ecommerce/core/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: CustomAuthAppBar(title: "Forget Password".tr),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) => ViewDataHandler(
          requestStatus: controller.status,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(children: [
              CustomAuthHeader(
                  title: "Enter your email".tr,
                  body: "We will check first if the email exists or not".tr),
              const SizedBox(height: 30),
              Form(
                key: controller.formKey,
                child: CustomTextField(
                  label: "Email".tr,
                  hint: "Enter your email".tr,
                  icon: const Icon(Icons.mail_outline),
                  controller: controller.email,
                  validator: (String? val) {
                    return validateInput(val!, 11, 100, "email");
                  },
                ),
              ),
              const SizedBox(height: 30),
              RoundedButton(
                title: "Check".tr,
                onPressed: () {
                  controller.checkEmail();
                },
              ),
              const SizedBox(height: 30),
            ]),
          ),
        ),
      ),
    );
  }
}
