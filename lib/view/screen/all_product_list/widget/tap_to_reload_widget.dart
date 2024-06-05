
import 'package:alladin_e_store/view/common_widget/custom_refresh_button.dart';
import 'package:alladin_e_store/view/common_widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TapToReloadWidget extends StatelessWidget {
  const TapToReloadWidget({super.key, required this.refreshTap, required this.tapCount});
  final VoidCallback refreshTap;
  final int tapCount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: size.height / 6),
        Image.asset(
          'assets/images/no_data.png',
          fit: BoxFit.fill,
          height: 250,
          width: 230,
        ),
        SizedBox(height: size.height / 10),
        tapCount < 3
            ? Column(
                children: [
                  CustomRefreshButton(refreshButton: refreshTap),
                  const CustomTextWidget(text: "Tap to Reload"),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
