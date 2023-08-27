import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class SigUpData {
  static postData(String username, String email, String password,
      String phoneNumber) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.signupRoute, {
      'username': username,
      'email': email,
      'password': password,
      'phone_number': phoneNumber
    });
    return response.fold((l) => l, (r) => r);
  }
}
