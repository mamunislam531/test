
import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:alladin_e_store/view/common_widget/custom_rating.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/favorite/widget/discount_tag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingProductCardImage extends StatelessWidget {
  const TrendingProductCardImage({
    super.key,
    required this.networkImage,
    required this.height,
    required this.width,
    required this.onTap,
    required this.discountType,
    required this.discountPrice,
    required this.regularPrice,
    required this.rating,
    required this.productName,
  });

  final double height;
  final double width;
  final String networkImage;
  final VoidCallback onTap;
  final int discountType;
  final double discountPrice;
  final double regularPrice;
  final int rating;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: networkImage,
        imageBuilder: (context, imageProvider) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(3), image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(text: productName, fontSize: 12, maxLine: 2),
                              CustomRating(ratingStar: rating),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomTextWidget(text: regularPrice.toString(), fontSize: 15, fontColor: AppColors.bg1LightColor, maxLine: 2),
                                  const SizedBox(width: 5),
                                  const CustomTextWidget(text: "BDT", fontSize: 11, fontColor: AppColors.bg1LightColor, maxLine: 2),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: -35,
                  child: DiscountTag(discountType: discountType, discountPrice: discountPrice),
                )
              ],
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
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: height / 10, color: Colors.red),
              const SizedBox(height: 10),
              const CustomTextWidget(text: "No Image Found..!!", fontColor: Colors.black54, fontSize: 12)
            ],
          ),
        ),
      ),
    );
  }
}
