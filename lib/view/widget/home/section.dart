import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String leading;
  final String? trailing;
  final void Function()? onPressed;

  const Section({super.key, required this.leading, this.trailing,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: trailing == null
            ? [
                Text(
                  leading,
                  style: const TextStyle(fontSize: 18),
                )
              ]
            : [
                Text(
                  leading,
                  style: const TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: Text(
                    trailing!,
                    style: const TextStyle(color: AppColor.grey2)
                  ),
                )
              ],
      ),
    );
  }
}
