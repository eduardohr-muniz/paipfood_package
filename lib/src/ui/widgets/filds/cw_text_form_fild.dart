// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

import '../buttons/cw_icon_tolltip.dart';

class CwTextFormFild extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String label;
  final FocusNode? focusNode;
  final bool expanded;
  final int? flex;
  final int? minLines;
  final int? maxLines;
  final String? helperText;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool filled;
  final bool enabled;
  final String? tooltipMessage;
  final IconData? tooltipIcon;
  final String? counterText;

  const CwTextFormFild(
      {required this.label,
      Key? key,
      this.controller,
      this.initialValue,
      this.validator,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.focusNode,
      this.expanded = false,
      this.minLines,
      this.maxLines,
      this.helperText,
      this.prefixText,
      this.inputFormatters,
      this.onChanged,
      this.keyboardType,
      this.filled = true,
      this.enabled = true,
      this.tooltipMessage,
      this.tooltipIcon,
      this.counterText,
      this.flex})
      : super(key: key);

  @override
  State<CwTextFormFild> createState() => _CwTextFormFildState();
}

class _CwTextFormFildState extends State<CwTextFormFild> {
  bool _obscure = false;
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) widget.controller?.text = widget.initialValue!;
    if (widget.obscureText) _obscure = true;
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.label, style: context.textTheme.labelMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                widget.tooltipMessage != null
                    ? CwIconTolltip(tooltipMessage: widget.tooltipMessage!, icon: widget.tooltipIcon, iconSize: 18)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: _obscure,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            cursorColor: context.color.primaryColor,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.primaryBG)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.primaryBG)),
                filled: widget.filled,
                isDense: true,
                fillColor: context.color.primaryBG,
                enabled: widget.enabled,
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.primaryBG)),
                floatingLabelStyle: TextStyle(color: context.color.primaryColor),
                helperText: widget.helperText,
                counterText: widget.counterText,
                prefixIconColor: context.color.primaryColor,
                prefixText: widget.prefixText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        onPressed: () => setState(() => _obscure = !_obscure),
                        icon: Icon(_obscure ? Icomoon.eye_slash : Icomoon.eye),
                      )
                    : widget.suffixIcon,
                // labelText: widget.label,
                hintText: widget.hintText),
          )
        ],
      ),
    );
    return widget.expanded ? Expanded(flex: widget.flex ?? 1, child: child) : child;
  }
}
