import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class NotificationsData {
    static Crud crud = Get.find();

  static postGetNotifications(String userId) async {
    var response = await crud.postData(Links.notifications,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }

}