import 'package:ecommerce/controller/auth/signup/verifycode_signup_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpController());
    return Scaffold(
        appBar: CustomAuthAppBar(title: "Verification Code".tr),
        body: GetBuilder<VerifyCodeSignUpController>(
          builder: (controller) => ViewDataHandler(
            requestStatus: controller.status,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(children: [
                CustomAuthHeader(
                    title: "OTP Verification".tr,
                    body: "We sent a code to your email please enter it".tr),
                const SizedBox(height: 30),
                CustomAuthOtp(
                  onSubmit: (String verificationCode) {
                    controller.checkTheCode(verificationCode);
                  },
                ),
                TextButton(
                    onPressed: () {
                      controller.resendVerifyCode();
                    },
                    child: const Text(
                      "Resend Verification Code",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColor.blue),
                    ))
              ]),
            ),
          ),
        ));
  }
}
