 import 'package:alladin_e_store/view/common_widget/custom_shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLoadingScreen extends StatefulWidget {
  const ShimmerLoadingScreen({super.key});

  @override
  State<ShimmerLoadingScreen> createState() => _ShimmerLoadingScreenState();
}

class _ShimmerLoadingScreenState extends State<ShimmerLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.grey.shade100,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const CustomShimmer();
              },
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              const CustomShimmer(),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: .67),
                  itemBuilder: (_, gridIndex) {
                    return const CustomShimmer();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
