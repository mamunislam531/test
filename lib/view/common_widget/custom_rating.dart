 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, required this.ratingStar});
  final int ratingStar;

  @override
  Widget build(BuildContext context) {
    int ratingCount = 0;
    if (ratingStar > 5) {
      ratingCount = 0;
    } else {
      ratingCount = ratingStar;
    }
    return SingleChildScrollView(
      child: Row(
        children: [
          SizedBox(
            width: ratingCount * 11,
            height: 20,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ratingCount,
                itemBuilder: (context, index) {
                  return const Icon(Icons.star, color: Colors.orange, size: 11);
                }),
          ),
          SizedBox(
            width: (5 - ratingCount) * 12,
            height: 20,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5 - ratingCount,
                itemBuilder: (context, index) {
                  return const Icon(Icons.star_border, color: Colors.orange, size: 11);
                }),
          ),
          CustomTextWidget(text: "($ratingCount/5)", fontSize: 12)
        ],
      ),
    );
  }
}
