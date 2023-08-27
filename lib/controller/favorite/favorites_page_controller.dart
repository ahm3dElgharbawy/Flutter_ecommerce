import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/app_routes.dart';
import 'package:ecommerce/core/functions/response_handler.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:ecommerce/data/model/favorites_model.dart';
import 'package:get/get.dart';

class FavoritesPageController extends GetxController {
  MyServices myServices = Get.find();
  RequestStatus status = RequestStatus.none;
  List<FavoritesModel> favorites = [];

  getFavorites() async {
    favorites.clear();
    status = RequestStatus.isLoading;
    update();
    var response = await FavoriteData.getAllFavorites(
        myServices.prefs.getString("userId")!);
    RequestStatus request = responseHandler(response);
    if (request == RequestStatus.success) {
      List data = response["data"];
      favorites.addAll(data.map((e) => FavoritesModel.fromJson(e)));
    }
    status = request;
    update();
  }
  removeFavorite(String favoriteId){
    FavoriteData.removeFromFavorites(favoriteId);
    favorites.removeWhere((product) => product.favoriteId ==favoriteId,);
    update();
  }

  toProductDetails(productModel) {
    Get.toNamed(AppRoutes.productDetails,arguments: {"product": productModel});
  }

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }
}
