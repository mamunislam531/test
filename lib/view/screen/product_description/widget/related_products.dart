
import 'package:alladin_e_store/view/common_widget/custom_rating.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:alladin_e_store/view/screen/favorite/widget/discount_price_text.dart';
import 'package:alladin_e_store/view/screen/favorite/widget/discount_tag.dart';
import 'package:alladin_e_store/view/screen/product_description/product_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelatedProducts extends StatelessWidget {
  const RelatedProducts({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(
                ProductDescription(
                  productData: data,
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.zero,
              shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(.3))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      child: Image.network(
                        data['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: data['name'], fontSize: 12, maxLine: 2),
                        CustomRating(ratingStar: data['rating']),
                        DiscountPrice(
                            regularPrice: data['reg_price'],
                            discountPrice: data['dis_price'],
                            discountType: data['dis_type'].toString())
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
            child: DiscountTag(
              discountType: data['dis_type'],
              discountPrice: double.parse(data['dis_price'].toString()),
            ),
          )
        ],
      ),
    );
  }
}
