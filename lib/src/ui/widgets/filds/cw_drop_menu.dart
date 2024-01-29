import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class CwDropMenu<Object> extends StatefulWidget {
  final String? label;
  final Object? initialValue;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  final bool filled;
  final String? tooltipMessage;
  final IconData? tooltipIcon;
  final List<DropdownMenuEntry<Object>> dropdownMenuEntries;

  const CwDropMenu({
    required this.dropdownMenuEntries,
    Key? key,
    this.label,
    this.initialValue,
    this.controller,
    this.prefixIcon,
    this.filled = true,
    this.tooltipMessage,
    this.tooltipIcon,
  }) : super(key: key);

  @override
  State<CwDropMenu> createState() => _CwDropMenuState();
}

class _CwDropMenuState extends State<CwDropMenu> {
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
                child: Text(widget.label!, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)

                // Row(
                //   children: [
                //     Expanded(child: Text(widget.label!, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
                //     widget.tooltipMessage != null
                //         ? CwIconTolltip(tooltipMessage: widget.tooltipMessage!, icon: widget.tooltipIcon, iconSize: 18)
                //         : const SizedBox.shrink(),
                //   ],
                // ),
                ),
          DropdownMenu<dynamic>(
            initialSelection: widget.initialValue,
            dropdownMenuEntries: widget.dropdownMenuEntries,
            controller: widget.controller,
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
                maxWidth: 300,
                minHeight: 40,
                minWidth: 40,
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
