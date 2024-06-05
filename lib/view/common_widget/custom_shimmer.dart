import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.containerColor,
    this.height,
    this.width,
    this.margin,
  });
  final Color? baseColor;
  final Color? highlightColor;
  final Color? containerColor;
  final double? height;
  final double? width;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white,
      highlightColor: highlightColor ?? Colors.grey.shade200,
      period: const Duration(milliseconds: 1000),
      child: Container(
        margin: EdgeInsets.all(margin ?? 5),
        color: containerColor ?? Colors.grey,
        height: height ?? 100,
        width: width ?? MediaQuery.sizeOf(context).width,
      ),
    );
  }
}