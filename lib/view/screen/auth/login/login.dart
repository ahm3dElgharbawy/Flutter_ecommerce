import 'package:ecommerce/controller/auth/login/login_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:ecommerce/core/functions/exit_app_alert.dart';
import 'package:ecommerce/core/functions/validate_input.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_footer.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_forget_password.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:ecommerce/core/shared/custom_text_field.dart';
import 'package:ecommerce/view/widget/Auth/social_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: CustomAuthAppBar(title: "Sign In".tr),
      body: WillPopScope(
        onWillPop: () {
          showExitAlert();
          return Future.value(true);
        },
        child: GetBuilder<LoginController>(
          builder: (controller) => ViewDataHandler(
            requestStatus: controller.status,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: controller.formKey,
                child: ListView(children: [
                  SvgPicture.asset(
                    AppImageAsset.logo,
                    height: 100,
                  ),
                  const SizedBox(height: 5),
                  CustomAuthHeader(
                    title: "Welcome Back".tr,
                    body:
                        "Sign in with your email and password or continue with social media"
                            .tr,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: controller.email,
                    label: "Email".tr,
                    hint: "Enter your email".tr,
                    icon: const Icon(Icons.email_outlined),
                    validator: (String? val) {
                      return validateInput(val!, 11, 100, "email");
                    },
                  ),
                  const SizedBox(height: 30),
                  GetBuilder<LoginController>(
                    builder: (controller) => CustomTextField(
                      controller: controller.password,
                      obscureText: controller.isTextHidden,
                      label: "Password".tr,
                      hint: "Enter your password".tr,
                      icon: const Icon(Icons.lock_outline),
                      validator: (String? val) {
                        return validateInput(val!, 8, 16, "password");
                      },
                      onIconPressed: () {
                        controller.showOrHide();
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  const CustomAuthForgetPassword(),
                  const SizedBox(height: 20),
                  RoundedButton(
                      title: "Login".tr,
                      onPressed: () {
                        controller.login();
                      }),
                  const SizedBox(height: 30),
                  const SocialMedia(),
                  CustomAuthFooter(
                      title: "Don't have an account?".tr,
                      linkTitle: "Sign Up".tr,
                      onPressed: () {
                        controller.toSignup();
                      })
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
