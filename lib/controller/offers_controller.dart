import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/offers_data.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List offers = [];
  getOffers() async {
    status = RequestStatus.isLoading;
    update(); // update ui and continue the code below
    var response = await OffersData.postGetOffers(myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      offers = response['data'];
    }
    status = request;
    update();
  }

  toProductDetails(ProductsModel productModel) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"product": productModel});
  }

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }
}