import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

// verify code from php
class ResetPasswordData {
  static postData(String email,String password) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.resetPassword,{
      'email' : email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
