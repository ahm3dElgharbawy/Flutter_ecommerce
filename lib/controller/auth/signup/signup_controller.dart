import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsSignUpController extends GetxController {
  GlobalKey<FormState>? formKey;
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phoneNumber;
  bool isTextHidden = true;
  RequestStatus status = RequestStatus.none;
  singup();
  toLogin();
}

class SignUpController extends AbsSignUpController {
  @override
  singup() async {
    if (formKey!.currentState!.validate()) {
      status = RequestStatus.isLoading;
      update(); // update ui and continue the code below
      var response = await SigUpData.postData(
          userName.text, email.text, password.text, phoneNumber.text);
      RequestStatus request = responseHandler(response);
      if (request == RequestStatus.success) {
        Get.offNamed(AppRoutes.verifyCodeSignUp,arguments: {"email": email.text});
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
  toLogin() {
    Get.offNamed(AppRoutes.login);
  }

  showOrHide() {
    isTextHidden = !isTextHidden;
    update();
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    userName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phoneNumber = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    super.dispose();
  }
}
