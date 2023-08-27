import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class AbsHomeController extends GetxController {
  MyServices services = Get.find();
  late Map currentUser;
  List settings = [];
  List categories = [];
  List offers = []; 
  List topSellingProducts = [];
  RequestStatus status = RequestStatus.none;
  initData();
  getData();
  toProductsPage(List categories, String selectedCatId);
}

class HomeController extends AbsHomeController {
  @override
  getData() async {
    clearData();
    status = RequestStatus.isLoading;
    update(); // update ui and continue the code below
    var response = await HomeData.postData();
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      settings = response['data']['settings'];
      categories = response['data']['categories'];
      offers = response['data']['offers'];
      topSellingProducts = response['data']['topSellingProducts'];
    }
    status = request;
    update();
  }

  @override
  toProductsPage(categories, selectedCatId) {
    Get.toNamed(AppRoutes.productsPage,
        arguments: {'categories': categories, 'catId': selectedCatId});
  }
  clearData(){
    categories.clear();
    topSellingProducts.clear();
    offers.clear();
  }
  @override
  initData() async {
    FirebaseMessaging.instance.subscribeToTopic("home");
    currentUser = {
      'id': services.prefs.getString('id'),
      'username': services.prefs.getString('username'),
      'email': services.prefs.getString('email'),
      'phoneNumber': services.prefs.getString('phoneNumber')
    };
  }

  @override
  void onInit() {
    initData();
    getData();
    super.onInit();
  }
}
