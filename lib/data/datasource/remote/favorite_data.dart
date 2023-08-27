import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/links.dart';
import 'package:get/get.dart';

class FavoriteData {
  static Crud crud = Get.find();

  static postAddData(String userId,String productId) async {
    var response = await crud.postData(Links.addFavorite,{"user_id":userId,"product_id":productId});
    return response.fold((l) => l, (r) => r);
  }
  static postRemoveData(String userId,String productId) async {
    var response = await crud.postData(Links.removeFavorite,{"user_id":userId,"product_id":productId});
    return response.fold((l) => l, (r) => r);
  }
  static getAllFavorites(String userId) async {
    var response = await crud.postData(Links.favorites,{"user_id":userId});
    return response.fold((l) => l, (r) => r);
  }
  static removeFromFavorites(String favoriteId) async {
    var response = await crud.postData(Links.removeFromFavorites,{"favorite_id":favoriteId});
    return response.fold((l) => l, (r) => r);
  }
}
