import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class CustomAuthHeader extends StatelessWidget {
  final String title;
  final String body;
  const CustomAuthHeader({super.key,required this.title,required this.body});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 30),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            body,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.grey2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
