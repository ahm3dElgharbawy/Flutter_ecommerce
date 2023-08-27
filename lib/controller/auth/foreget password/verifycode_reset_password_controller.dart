import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/auth/forget%20password%20data/verify_forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsVerifyCodeResetPasswordController extends GetxController {
  checkTheCode(String code);
  toResetPassword();
  RequestStatus status = RequestStatus.none;
  late String email;
}

class VerifyCodeResetPasswordController
    extends AbsVerifyCodeResetPasswordController {
  @override
  checkTheCode(String code) async {
    status = RequestStatus.isLoading;
    update(); // update ui and continue the code below
    var response = await VerifyCodeForgetPasswordData.postData(email, code);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      Get.offNamed(AppRoutes.resetPassword, arguments: Get.arguments);
    } else {
      if (request == RequestStatus.noData) {
        Get.defaultDialog(title: "ERROR", content: Text(response['message']));
      }
      status = request;
      update();
    }
  }

  @override
  toResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
