import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  const TabCard({super.key, required this.iconData, required this.text});
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          Text(text,maxLines: 1,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
