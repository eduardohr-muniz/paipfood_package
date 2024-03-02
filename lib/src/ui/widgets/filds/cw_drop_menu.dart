import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwDropMenu<T> extends StatefulWidget {
  final String? label;
  final T? initialValue;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;
  final bool filled;
  final double? minWidth;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final bool isExpanded;
  final void Function(T?)? onSelected;

  const CwDropMenu({
    required this.dropdownMenuEntries,
    required this.onSelected,
    Key? key,
    this.label,
    this.initialValue,
    this.controller,
    this.prefixIcon,
    this.filled = true,
    this.hintText,
    this.minWidth,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<CwDropMenu<T>> createState() => _CwDropMenuState<T>();
}

class _CwDropMenuState<T> extends State<CwDropMenu<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(widget.label!, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
          DropdownMenu<T>(
            hintText: widget.hintText,
            initialSelection: widget.initialValue,
            onSelected: widget.onSelected,
            dropdownMenuEntries: widget.dropdownMenuEntries,
            controller: widget.controller,
            expandedInsets: widget.isExpanded ? const EdgeInsets.all(0) : null,
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: context.isDarkTheme ? 0 : 1, color: context.isDarkTheme ? context.color.onPrimaryBG : PColors.neutral_.get300)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: context.color.primaryColor)),
              errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: context.color.errorColor)),
              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.5, color: context.color.errorColor)),
              filled: widget.filled,
              isDense: true,
              constraints: const BoxConstraints(
                maxHeight: 40,
                minHeight: 40,
              ),
              fillColor: context.color.onPrimaryBG,
              errorMaxLines: 10,
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.onPrimaryBG)),
              floatingLabelStyle: TextStyle(color: context.color.primaryColor),
              prefixIconColor: context.color.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
