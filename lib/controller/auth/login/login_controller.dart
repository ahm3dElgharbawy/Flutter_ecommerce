import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AbsLoginController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController email;
  late TextEditingController password;
  bool isChecked = false;
  bool isTextHidden = true;
  RequestStatus status = RequestStatus.none;
  MyServices services = Get.find();

  login();
  toHomePage();
  toSignup();
  toForgetPassword();
  changeCheckBoxState();
}

class LoginController extends AbsLoginController {
  @override
  login() async {
    if (formKey.currentState!.validate()) {
      status = RequestStatus.isLoading;
      update(); // update ui and continue the code below
      var response = await LoginData.postData(email.text, password.text);
      RequestStatus request = responseHandler(response);
      if (request == RequestStatus.success) {
        if (response['data']['approved'] == '1') {
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("user${response['data']['user_id']}");
          services.prefs.setString("userId", response['data']['user_id']);
          services.prefs.setString("userName", response['data']['username']);
          services.prefs.setString("email", response['data']['email']);
          services.prefs.setString("phoneNumber", response['data']['phone_number']);
          toHomePage();
        } else {
          Get.offNamed(AppRoutes.verifyCodeSignUp,arguments: {'email':response['data']['email']});
        }
      } else {
        if (request == RequestStatus.noData) {
          Get.defaultDialog(title: "Alert", content: const Text("Email or Password not correct"));
        }
        status = request;
        update();
      }
    }
  }

  @override
  toHomePage() {
    Get.offNamed(AppRoutes.homePage);
  }

  @override
  toSignup() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  toForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  @override
  changeCheckBoxState() {
    isChecked = !isChecked;
    isChecked?services.prefs.setString("step", "2"):services.prefs.setString("step", "1");
    update();
  }

  showOrHide() {
    isTextHidden = !isTextHidden;
    update();
  }

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
