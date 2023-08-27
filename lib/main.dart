import 'package:ecommerce/bindings/my_binding.dart';
import 'package:ecommerce/core/constants/app_themes.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/core/localization/translations_file.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: TranslationsFile(),
      locale: controller.language,
      title: 'Ecommerce',
      theme: myTheme,
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}
