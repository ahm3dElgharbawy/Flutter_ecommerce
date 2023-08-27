import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences prefs;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    prefs = await SharedPreferences.getInstance();
    return this;  // return MyServices()
  }

}

startServices() async {
  await Get.putAsync(() => MyServices().init());
}
