import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/auth/forget%20password%20data/check_email_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsForgetPasswordController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  // String? errorMessage = null;
  RequestStatus status = RequestStatus.none; 
  checkEmail();
  toVerifyCode();
}

class ForgetPasswordController extends AbsForgetPasswordController {
  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      status = RequestStatus.isLoading;
      update(); // update ui and continue the code below
      var response = await CheckEmailData.postData(email.text);
      RequestStatus request = responseHandler(response);
      if (request == RequestStatus.success) {
        Get.offNamed(AppRoutes.verifyCodeForgetPassword,arguments: {"email":email.text});
      } else {
        if (request == RequestStatus.noData) {
          Get.defaultDialog(title: "ERROR", content: Text(response['message']));
        }
        status = request;
        update();
      }
    }
  }
  
  @override
  toVerifyCode() {
    Get.offNamed(AppRoutes.verifyCodeForgetPassword);
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    email.selection = TextSelection.fromPosition(TextPosition(offset: email.text.length));
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
