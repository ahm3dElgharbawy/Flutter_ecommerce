import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/products_data.dart';
import 'package:ecommerce/data/model/products_model.dart';
import 'package:get/get.dart';

import '../../core/class/request_status.dart';
import '../../core/constants/app_routes.dart';
import '../../core/functions/response_handler.dart';

abstract class AbsProductsController extends GetxController {
  MyServices services = Get.find();
  late String userId;
  late List categories;
  late String selectedCatId;
  RequestStatus status = RequestStatus.none;
  List products = [];
  toProductDetails(ProductsModel productModel);
  getData(String catId);
  initData();
  selectCategory(String catId);
}

class ProductsController extends AbsProductsController {
  @override
  getData(catId) async {
    products.clear();
    status = RequestStatus.isLoading;
    update();
    var response = await ProductsData.postData(catId, userId);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      products = response['data'];
    }
    status = request;
    update();
  }

  @override
  initData() {
    userId = services.prefs.getString("userId")!;
    categories = Get.arguments['categories'];
    selectedCatId = Get.arguments['catId'];
    getData(selectedCatId);
  }

  @override
  selectCategory(catId) {
    if (catId != selectedCatId) {
      getData(catId);
      selectedCatId = catId;
      update();
    }
  }

  @override
  toProductDetails(productModel) {
    Get.toNamed(AppRoutes.productDetails, arguments: {"product": productModel});
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
