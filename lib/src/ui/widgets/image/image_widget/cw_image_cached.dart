import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwImageCached extends StatefulWidget {
  final double size;
  final String? pathImage;
  const CwImageCached({
    Key? key,
    this.size = 0.0,
    this.pathImage,
  }) : super(key: key);

  @override
  State<CwImageCached> createState() => _CwImageCachedState();
}

class _CwImageCachedState extends State<CwImageCached> {
  static String baseUrl = "https://vipwbbuyhszmxdjsclzg.supabase.co/storage/v1/object/public/images/";

  @override
  Widget build(BuildContext context) {
    if (widget.pathImage == null || widget.pathImage!.isEmpty) {
      return Container(
        color: context.color.onPrimaryBG,
        width: widget.size,
        height: widget.size,
        child: Icon(Icomoon.info_circle, size: widget.size / 3),
      );
    }
    return CachedNetworkImage(
      imageUrl: "$baseUrl${widget.pathImage}",
      height: widget.size,
      width: widget.size,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
