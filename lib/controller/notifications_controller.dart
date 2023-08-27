import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notifications_data.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List notifications = [];

  getNotifications() async{
    status = RequestStatus.isLoading;
    update();
    var response = await NotificationsData.postGetNotifications(myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      notifications = response['data'];
    }
    status = request;
    update();
  }

  @override
  void onInit() {
    getNotifications();
    super.onInit();
  }
}