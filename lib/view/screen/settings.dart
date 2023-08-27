import 'package:ecommerce/controller/settings_controller.dart';
import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/datasource/static/color.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColor.grey3,
            backgroundImage: AssetImage(AppImageAsset.avatar),
          ),
          const SizedBox(
            height: 80,
          ),
          ListTile(
              onTap: () {},
              title: const Text("Disable Notifications"),
              trailing: Switch(
                value: true,
                onChanged: (state) {},
                activeColor: AppColor.blue,
              )),
          ListTile(
            onTap: () {
              controller.toPendingOrders();
            },
            title: const Text("Orders"),
            trailing: const Icon(Icons.wifi_protected_setup_outlined),
          ),
          ListTile(
            onTap: () {
              controller.toAddress();
            },
            title: const Text("Address"),
            trailing: const Icon(Icons.location_on_outlined),
          ),
          ListTile(
            onTap: () {},
            title: const Text("About Us"),
            trailing: const Icon(Icons.info_outline_rounded),
          ),
          ListTile(
            onTap: () async{
              await launchUrl(Uri.parse("tel:01028365306"));
            },
            title: const Text("Contact Us"),
            trailing: const Icon(Icons.call_outlined),
          ),
          ListTile(
            onTap: () {
              controller.logout();
            },
            title: const Text("Logout"),
            trailing: const Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
