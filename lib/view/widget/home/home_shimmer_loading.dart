import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoading extends StatelessWidget {
  const HomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 100,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 90,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 120,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 130,
            width: double.infinity,
            color: const Color(0xffEBEBEB),
          ),
        ],
      ),
    );
  }
}
