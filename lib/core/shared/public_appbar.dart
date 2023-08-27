import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class PublicAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;

  const PublicAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: title,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: AppColor.black,fontSize: 18),
        backgroundColor: AppColor.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.black),
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}