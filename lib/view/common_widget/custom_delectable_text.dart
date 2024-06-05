 import 'package:alladin_e_store/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSelectableTextWidget extends StatelessWidget {
  const CustomSelectableTextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontColor,
      this.maxLine,
      this.fontWeight,
      this.textOverflow,
      this.textAlign,
      this.fontFamily,
      this.textLineThrough});

  final String text;
  final bool? textLineThrough;
  final double? fontSize;
  final Color? fontColor;
  final int? maxLine;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      maxLines: maxLine,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: AppColors.bg1LightColor.withOpacity(.5),
        decoration: textLineThrough == true ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2.1,
        fontFamily: fontFamily ?? 'RobotoSerif',
        color: fontColor,
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: textOverflow ?? TextOverflow.ellipsis,
      ),
    );
  }
}
