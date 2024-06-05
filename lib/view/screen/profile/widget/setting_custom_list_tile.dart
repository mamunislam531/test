import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: .4,
        surfaceTintColor: Colors.transparent,
        shape: const OutlineInputBorder(borderSide: BorderSide.none),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: title,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}
