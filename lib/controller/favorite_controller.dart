import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';


class FavoriteController extends GetxController {
  MyServices myServices = Get.find();
  Map isFavorite = {};

  setFavorite(String key , String value){
    isFavorite[key] = value;
    update();
  }

  addToFavorite(String productId) async{
    await FavoriteData.postAddData(myServices.prefs.getString("userId")!,productId);
  }

  removeFromFavorite(String productId) async {
    await FavoriteData.postRemoveData(myServices.prefs.getString("userId")!,productId);
  }

}