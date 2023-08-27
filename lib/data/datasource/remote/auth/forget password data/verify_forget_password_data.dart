import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

// verify code from php
class VerifyCodeForgetPasswordData {
  static postData(String email,String code) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.verifyCode,{
      'email' : email,
      'verify_code' : code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
