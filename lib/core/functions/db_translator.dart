import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

dbTranslator(String enStatment,String arStatment){
  MyServices myServices = Get.find();
  if(myServices.prefs.getString("lang") == "ar"){
    return arStatment;
  }
  else{
    return enStatment;
  }
}