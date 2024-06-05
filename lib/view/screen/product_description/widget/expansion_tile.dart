 import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key, required this.description, required this.title});
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey.shade50,
      backgroundColor: Colors.grey.shade50,
      shape: const OutlineInputBorder(),
      childrenPadding: buildEdgeInsets(h: 5, v: 10),
      tilePadding: buildEdgeInsets(h: 5, v: 2),
      title: Text(title),
      children: [
        CustomTextWidget(
          text: description,
          fontSize: 13,
          maxLine: 50,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }

  // Custom Padding  EdgeInsets with symmetric
  EdgeInsets buildEdgeInsets({double? h, double? v}) => EdgeInsets.symmetric(horizontal: h ?? 0, vertical: v ?? 0);
}
