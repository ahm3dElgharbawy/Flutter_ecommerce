import 'package:ecommerce/controller/notifications_controller.dart';
import 'package:ecommerce/core/class/view_data_handler.dart';
import 'package:ecommerce/core/shared/public_appbar.dart';
import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: const PublicAppBar(title: Text("Notifications")),
      body: GetBuilder<NotificationsController>(
        builder: (controller) => ViewDataHandler(
          requestStatus: controller.status,
          widget: ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, i) => Container(
              height: 100,
              color: AppColor.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.notifications[i]["title"]),
                  Text(controller.notifications[i]["body"]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                    Text(Jiffy(controller.notifications[i]["date_time"],"yyyy-MM-dd").fromNow(),style: const TextStyle(color: AppColor.blue),)
                  ],)
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


