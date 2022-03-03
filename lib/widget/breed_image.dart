import 'package:dog_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageBox extends StatelessWidget {
  final String? url;
  const NetworkImageBox({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url ?? '',
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlight,
          child: Container(
            color: Colors.grey,
          ),
        );
      },
      errorBuilder: (_, a, b) => Container(
        color: Colors.white,
      ),
    );
  }
}
