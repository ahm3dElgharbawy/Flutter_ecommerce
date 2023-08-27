import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class CustomLangButton extends StatelessWidget {
  final String title;
  final Image leadingImage;
  final void Function()? onClick;
  const CustomLangButton({super.key, required this.title,required this.leadingImage ,this.onClick});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      highlightColor: AppColor.background,
      onPressed: onClick,
      child: ListTile(
        leading: leadingImage,
        title: Text(title),
      ),
    );
  }
}
