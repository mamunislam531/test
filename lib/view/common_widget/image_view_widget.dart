import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewWidget extends StatelessWidget {
  final String imgUrl;

  const ImageViewWidget({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Hero(
              tag: 'dash',
              child: PhotoView(
                imageProvider: NetworkImage(
                  imgUrl,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
