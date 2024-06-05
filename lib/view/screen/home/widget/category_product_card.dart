 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductCart extends StatelessWidget {
  const CategoryProductCart({super.key, required this.onTap, required this.image, required this.name, required this.height, required this.width});

  final VoidCallback onTap;
  final String image;
  final String name;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
                  ),
                  CustomTextWidget(text: name.length < 13 ?name : name.substring(0,12), fontSize: 12, maxLine: 1),
                ],
              ),
            ),
          );
        },
        placeholder: (context, url) => Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300)),
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200,
            period: const Duration(milliseconds: 1000),
            child: Container(
              color: Colors.grey,
              height: height,
              width: width,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: height / 3, color: Colors.red),
              const SizedBox(height: 10),
              const CustomTextWidget(text: "Error", fontColor: Colors.black54, fontSize: 12)
            ],
          ),
        ),
      ),
    );
  }
}
