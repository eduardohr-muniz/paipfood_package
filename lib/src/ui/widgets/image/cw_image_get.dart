// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwImageGet extends StatefulWidget {
  final double height;
  final double width;
  final double padding;
  final String? pathImage;
  final void Function() onTap;
  final void Function() onDelete;
  const CwImageGet({
    required this.height,
    required this.width,
    required this.onTap,
    required this.onDelete,
    Key? key,
    this.padding = 10,
    this.pathImage,
  }) : super(key: key);

  @override
  State<CwImageGet> createState() => _CwImageGetState();
}

class _CwImageGetState extends State<CwImageGet> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() => onHover = value),
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
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
                      child: widget.pathImage != null
                          ? Image.network(
                              widget.pathImage!,
                              width: widget.width,
                              height: widget.width,
                              fit: BoxFit.cover,
                            )
                          : CwEmptyState(
                              icon: Icomoon.camera,
                              size: widget.width,
                              bgColor: false,
                              iconColor: onHover ? context.color.primaryColor : null,
                            )),
                )),
            Visibility(
              visible: onHover,
              child: Align(
                alignment: Alignment.topRight,
                child: widget.pathImage != null
                    ? InkWell(
                        onTap: widget.onDelete,
                        child: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: context.color.errorColor,
                          child: const Icon(Icomoon.trash, color: Colors.white, size: 20),
                        ))
                    : CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: context.color.primaryColor,
                        child: const Icon(Icomoon.add, color: Colors.white, size: 20),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
