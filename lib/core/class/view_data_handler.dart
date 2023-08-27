import 'package:ecommerce/core/class/request_status.dart';
import 'package:ecommerce/core/constants/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ViewDataHandler extends StatelessWidget {
  final Widget widget;
  final RequestStatus requestStatus;
  final void Function()? onTapOffline;
  final Widget? shimmerLoading;
  const ViewDataHandler(
      {super.key,
      required this.requestStatus,
      required this.widget,
      this.shimmerLoading,
      this.onTapOffline});

  @override
  Widget build(BuildContext context) {
    
    switch (requestStatus) {
      case RequestStatus.isLoading:
          return shimmerLoading??Center(child: Lottie.asset(AppImageAsset.loading, width: 150));
      case RequestStatus.serverError:
          return Center(child: Lottie.asset(AppImageAsset.error404,width: 200, repeat: false));
      case RequestStatus.noData:
          return Center(child: Image.asset(AppImageAsset.empty,width: 100,));
      case RequestStatus.offline:
          return Center(
            child: GestureDetector(
              onTap: onTapOffline,
              child: Lottie.asset(AppImageAsset.noInternet,width: 200, repeat: false),
            ),
          );
      default:
          return widget;
    }
  }
}
