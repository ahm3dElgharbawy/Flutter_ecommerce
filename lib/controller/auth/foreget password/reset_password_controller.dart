import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/data/datasource/remote/auth/forget%20password%20data/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsResetPassword extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  String? errorMessage;
  bool isTextOneHidden = true;
  bool isTextTwoHidden = true;
  RequestStatus status = RequestStatus.none;
  late String email;
  checkPassword();
  toSuccessResetPassword();
}

class ResetPasswordController extends AbsResetPassword {
  @override
  checkPassword() async {
    if (formKey.currentState!.validate()) {
      if (notEqual()) {
        errorMessage = "confirmed password not match the first".tr;
        update();
      } else {
        status = RequestStatus.isLoading;
        update();
        var response = await ResetPasswordData.postData(email, password.text);
        RequestStatus request = responseHandler(response);
        if (request == RequestStatus.success) {
          toSuccessResetPassword();
        } else {
          if (request == RequestStatus.noData) {
            Get.defaultDialog(title: "ERROR", content: Text(response['message']));
          }
          status = request;
          update();
        }
      }
    }
  }

  @override
  toSuccessResetPassword() {
    Get.offNamed(AppRoutes.successResetPassword);
  }

  bool notEqual() {
    return password.text != confirmPassword.text;
  }

  showOrHide1() {
    isTextOneHidden = !isTextOneHidden;
    update();
  }

  showOrHide2() {
    isTextTwoHidden = !isTextTwoHidden;
    update();
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
