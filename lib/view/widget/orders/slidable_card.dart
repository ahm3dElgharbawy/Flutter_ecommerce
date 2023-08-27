import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableCard extends StatelessWidget {
  final Widget child;
  final void Function()? onPressedActionPane;
  const SlidableCard({super.key,required this.onPressedActionPane,required this.child});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(right: 5),
            decoration: const BoxDecoration(
              color: AppColor.red3,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
            ),
            child: MaterialButton(
              onPressed: onPressedActionPane,
              child: const Icon(Icons.delete_outline, color: AppColor.red2),
            )),
        extentRatio: 0.2,
        children: const [],
      ),
      child: child
    );
  }
}