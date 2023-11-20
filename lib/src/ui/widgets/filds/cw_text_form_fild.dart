import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';
import '../buttons/cw_icon_tolltip.dart';

class CwTextFormFild extends StatefulWidget {
  final MaskInputController? maskUtils;
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
  final AutovalidateMode? autovalidateMode;

  const CwTextFormFild({
    required this.label,
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
    this.flex,
    this.maskUtils,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  State<CwTextFormFild> createState() => _CwTextFormFildState();
}

class _CwTextFormFildState extends State<CwTextFormFild> {
  FocusNode? focusNode;
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscureText;
    focusNode = widget.maskUtils?.getFocusNode?.call();
    super.initState();
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
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
              children: [
                Expanded(child: Text(widget.label, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
                widget.tooltipMessage != null
                    ? CwIconTolltip(tooltipMessage: widget.tooltipMessage!, icon: widget.tooltipIcon, iconSize: 18)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          TextFormField(
            focusNode: widget.focusNode ?? focusNode,
            controller: widget.controller,
            obscureText: _obscure,
            inputFormatters: widget.maskUtils?.inpuFormatters ?? widget.inputFormatters,
            onChanged: widget.onChanged,
            cursorColor: context.color.primaryColor,
            minLines: widget.obscureText ? 1 : widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            validator: widget.maskUtils?.validator ?? widget.validator,
            keyboardType: widget.maskUtils?.textInputType ?? widget.keyboardType,
            initialValue: widget.initialValue,
            autovalidateMode: widget.autovalidateMode,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.onPrimaryBG)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.secondaryText)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: context.color.errorColor)),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.5, color: context.color.errorColor)),
                filled: widget.filled,
                isDense: true,
                fillColor: context.color.onPrimaryBG,
                enabled: widget.enabled,
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.color.onPrimaryBG)),
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
                hintText: widget.maskUtils?.hint ?? widget.hintText),
          )
        ],
      ),
    );
    return widget.expanded ? Expanded(flex: widget.flex ?? 1, child: child) : child;
  }
}
