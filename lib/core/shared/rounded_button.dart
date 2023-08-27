import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onPressed; 
  final String title;
  final double? radius;
  final EdgeInsets? padding;

  const RoundedButton({super.key,required this.onPressed,required this.title,this.radius,this.padding});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding??roundedButtonPadding ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius??10),
        ),
      ),
      child: Text(title),
    );
  }
}
