import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImageAsset.googleLogo),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImageAsset.facebookLogo),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AppImageAsset.twitterLogo),
        ),
      ],
    );
  }
}
