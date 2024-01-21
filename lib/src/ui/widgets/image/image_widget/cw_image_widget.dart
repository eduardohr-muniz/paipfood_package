// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwImageWidget extends StatefulWidget {
  final double size;
  final double padding;
  final String? pathImage;
  final Uint8List? imageBytes;
  final void Function() onTap;
  final String? baseUrl;
  const CwImageWidget({
    required this.size,
    required this.onTap,
    Key? key,
    this.padding = 10,
    this.pathImage,
    this.imageBytes,
    this.baseUrl,
  }) : super(key: key);

  @override
  State<CwImageWidget> createState() => _CwImageWidgetState();
}

class _CwImageWidgetState extends State<CwImageWidget> {
  bool onHover = false;
  String _baseUrl = "https://vipwbbuyhszmxdjsclzg.supabase.co/storage/v1/object/public/images/";
  @override
  void initState() {
    if (widget.baseUrl != null) _baseUrl = widget.baseUrl!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() => onHover = value),
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(top: widget.padding, right: widget.padding),
                child: Material(
                  elevation: onHover ? 3 : 1,
                  clipBehavior: Clip.antiAlias,
                  color: context.color.primaryBG,
                  borderRadius: Sz.i.borderRadiusAll,
                  child: InkWell(
                      borderRadius: Sz.i.borderRadiusAll,
                      onTap: widget.onTap,
                      child: Ink(
                        decoration: BoxDecoration(
                            borderRadius: Sz.i.borderRadiusAll,
                            border: Border.all(
                              color: widget.pathImage != null || widget.imageBytes != null ? Colors.transparent : context.color.secondaryText,
                            )),
                        child: () {
                          if (widget.imageBytes != null) {
                            return Image.memory(
                              widget.imageBytes!,
                              height: widget.size,
                              width: widget.size,
                              fit: BoxFit.cover,
                            );
                          }
                          if (widget.pathImage != null && widget.pathImage!.isNotEmpty) {
                            return CachedNetworkImage(
                              imageUrl: "$_baseUrl${widget.pathImage}",
                              height: widget.size,
                              width: widget.size,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            );
                          }
                          return CwEmptyState(
                            icon: Icomoon.camera,
                            size: widget.size - widget.size * 0.18,
                            bgColor: false,
                            iconColor: onHover ? context.color.primaryColor : null,
                          );
                        }(),
                      )),
                )),
            Visibility(
              visible: onHover,
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  maxRadius: widget.size * 0.15,
                  backgroundColor: context.color.primaryColor,
                  child: Icon(Icomoon.add, color: Colors.white, size: widget.size * 0.25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
