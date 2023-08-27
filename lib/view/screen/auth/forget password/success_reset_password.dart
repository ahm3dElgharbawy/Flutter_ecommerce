import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/shared/rounded_button.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_appbar.dart';
import 'package:ecommerce/view/widget/Auth/custom_auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthAppBar(title: "Success Reset Password".tr),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 100),
          const Icon(Icons.check_circle_outline_rounded,size: 150,color:AppColor.green),
          CustomAuthHeader(
              title: "Success Reset".tr,
              body: "Password reset successfully. now you can login with the new password".tr),
          const SizedBox(height: 200),
          RoundedButton(
              title: "Back to login page".tr,
              onPressed: () {
                Get.offAllNamed(AppRoutes.login);
              })
        ]),
      ),
    );
  }
}
