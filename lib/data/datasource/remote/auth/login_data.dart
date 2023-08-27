import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class LoginData {
  static postData(String email, String password) async {
    Crud crud = Get.find();

    var response = await crud.postData(Links.loginRoute, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
