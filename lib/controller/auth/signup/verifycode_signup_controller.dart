import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/auth/resend_verify_code.dart';
import 'package:ecommerce/data/datasource/remote/auth/verify_signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsVerifyCodeSignUpController extends GetxController {
  checkTheCode(String code);
  toSuccessSignUp();
  RequestStatus status = RequestStatus.none;
  late String email;
}

class VerifyCodeSignUpController extends AbsVerifyCodeSignUpController {
  @override
  checkTheCode(String code) async {
    status = RequestStatus.isLoading;
    update(); // update ui and continue the code below
    var response =
        await VerifySignUpData.postData(email, code);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      toSuccessSignUp();
    } else {
        if (request == RequestStatus.noData) {
          Get.defaultDialog(title: "ERROR", content: Text(response['message']));
        }
        status = request;
        update();
      }
  }

  @override
  toSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  resendVerifyCode(){
      ResendVerifyCode.postData(Get.arguments['email']);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
