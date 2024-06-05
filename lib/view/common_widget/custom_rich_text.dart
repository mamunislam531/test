import 'package:flutter/material.dart';


class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.titleText,
    required this.bodyText,
    this.titleStyle,
    this.bodyStyle, this.maxLine,
  });
  final String titleText;
  final String bodyText;
  final TextStyle? titleStyle;
  final TextStyle? bodyStyle;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLine ?? 4,
      text: TextSpan(style: titleStyle ?? const TextStyle(color: Colors.red, fontSize: 17, fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis), text: titleText, children: [
        TextSpan(
          text: bodyText,
          style: bodyStyle ?? const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
        ),
      ]),
    );
  }
}