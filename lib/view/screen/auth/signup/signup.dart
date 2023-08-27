import 'package:ecommerce/controller/auth/signup/signup_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/functions/exit_app_alert.dart';
import 'package:ecommerce/core/functions/validate_input.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_footer.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:ecommerce/core/shared/custom_text_field.dart';
import 'package:ecommerce/view/widget/Auth/social_media.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      appBar: CustomAuthAppBar(title: "Sign Up".tr),
      body: WillPopScope(
        onWillPop: () {
          showExitAlert();
          return Future.value(true);
        },
        child: GetBuilder<SignUpController>(
          builder: (controller) => ViewDataHandler(
            requestStatus: controller.status,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: controller.formKey,
                child: ListView(children: [
                  CustomAuthHeader(
                      title: "Complete Profile".tr,
                      body:
                          "Complete your details or continue with social media"
                              .tr),
                  const SizedBox(height: 30),
                  CustomTextField(
                      label: "Username".tr,
                      hint: "Enter your name".tr,
                      icon: const Icon(Icons.person_outline),
                      controller: controller.userName,
                      validator: (String? val) {
                        return validateInput(val!, 3, 16, "username");
                      }),
                  const SizedBox(height: 30),
                  CustomTextField(
                      label: "Email".tr,
                      hint: "Enter your email".tr,
                      icon: const Icon(Icons.mail_outline),
                      controller: controller.email,
                      validator: (String? val) {
                        return validateInput(val!, 11, 100, "email");
                      }),
                  const SizedBox(height: 30),
                  GetBuilder<SignUpController>(
                    builder: (controller) => CustomTextField(
                      label: "Password".tr,
                      hint: "Enter your password".tr,
                      icon: const Icon(Icons.lock_outline),
                      controller: controller.password,
                      obscureText: controller.isTextHidden,
                      validator: (String? val) {
                        return validateInput(val!, 8, 16, "password");
                      },
                      onIconPressed: () {
                        controller.showOrHide();
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                      label: "Phone".tr,
                      hint: "Enter your phone number".tr,
                      icon: const Icon(Icons.phone_outlined),
                      controller: controller.phoneNumber,
                      keyboardType: TextInputType.number,
                      validator: (String? val) {
                        return validateInput(val!, 11, 15, "phoneNumber");
                      }),
                  const SizedBox(height: 30),
                  RoundedButton(
                    title: "Continue".tr,
                    onPressed: () {
                      controller.singup();
                    },
                  ),
                  const SizedBox(height: 30),
                  const SocialMedia(),
                  CustomAuthFooter(
                    title: "Already have an account?".tr,
                    linkTitle: "Sign In".tr,
                    onPressed: () {
                      controller.toLogin();
                    },
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
