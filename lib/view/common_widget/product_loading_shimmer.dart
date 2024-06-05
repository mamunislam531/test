 import 'package:alladin_e_store/view/common_widget/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ProductLoadingShimmer extends StatelessWidget {
  const ProductLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: .7, crossAxisCount: 2),
      itemCount: 20,
      itemBuilder: (_, index) {
        return CustomShimmer(
          margin: 5,
          highlightColor: Colors.white,
          baseColor: Colors.grey.shade200,
          containerColor: Colors.white,
        );
      },
    );
  }
}
