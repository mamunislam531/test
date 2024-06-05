 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBannerImage extends StatelessWidget {
  const CustomBannerImage({
    super.key,
    required this.networkImage,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  final double height;
  final double width;
  final String networkImage;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: networkImage,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          );
        },
        placeholder: (context, url) => Container(
          color: Colors.red,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            period: const Duration(milliseconds: 1000),
            child: Container(height: height, width: width, color: Colors.red),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Icon(Icons.error, size: height / 10, color: Colors.blue)),
              const Spacer(),
              const CustomTextWidget(text: "No Image Found..!!", fontColor: Colors.blue, fontSize: 17)
            ],
          ),
        ),
      ),
    );
  }
}
