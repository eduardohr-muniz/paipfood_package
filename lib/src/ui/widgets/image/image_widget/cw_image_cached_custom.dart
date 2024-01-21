import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwImageCachedCustom extends StatefulWidget {
  final double width;
  final double heidth;
  final String? pathImage;
  final double iconEmptySize;
  const CwImageCachedCustom({
    Key? key,
    this.width = 0.0,
    this.heidth = 0.0,
    this.pathImage,
    this.iconEmptySize = 20,
  }) : super(key: key);

  @override
  State<CwImageCachedCustom> createState() => _CwImageCachedCustomState();
}

class _CwImageCachedCustomState extends State<CwImageCachedCustom> {
  static String baseUrl = "https://vipwbbuyhszmxdjsclzg.supabase.co/storage/v1/object/public/images/";

  @override
  Widget build(BuildContext context) {
    if (widget.pathImage == null || widget.pathImage!.isEmpty) {
      return Container(
        color: context.color.onPrimaryBG,
        width: widget.width,
        height: widget.heidth,
        child: Icon(Icomoon.info_circle, size: widget.iconEmptySize),
      );
    }
    return CachedNetworkImage(
      imageUrl: "$baseUrl${widget.pathImage}",
      height: widget.heidth,
      width: widget.width,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
