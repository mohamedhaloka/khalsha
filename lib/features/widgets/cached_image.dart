import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {this.imgUrl,
      this.border,
      this.height,
      this.width,
      this.fit,
      this.borderRadius,
      Key? key})
      : super(key: key);

  final String? imgUrl;
  final double? height, width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl!,
      height: height,
      width: width,
      imageBuilder: (c, i) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: border,
          image: DecorationImage(image: i, fit: fit),
        ),
      ),
      errorWidget: (BuildContext context, String str, error) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: border,
          image: const DecorationImage(
              image: ExactAssetImage('assets/images/no_image_placeholder.jpeg'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
