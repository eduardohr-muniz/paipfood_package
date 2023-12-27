import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';
import '../buttons/cw_icon_tolltip.dart';

class CwTextFormFild extends StatefulWidget {
  final String? label;
  final String? initialValue;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;
  final MaskInputController? maskUtils;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final String? hintText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final bool expanded;
  final int? flex;
  final int? minLines;
  final int? maxLines;
  final String? helperText;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool filled;
  final bool enabled;
  final String? tooltipMessage;
  final IconData? tooltipIcon;
  final String? counterText;
  final AutovalidateMode? autovalidateMode;

  const CwTextFormFild({
    Key? key,
    this.label,
    this.initialValue,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.expanded = false,
    this.minLines,
    this.maxLines = 1,
    this.helperText,
    this.prefixText,
    this.inputFormatters,
    this.keyboardType,
    this.filled = true,
    this.enabled = true,
    this.tooltipMessage,
    this.tooltipIcon,
    this.counterText,
    this.flex,
    this.maskUtils,
    this.autovalidateMode,
    this.autofocus = false,
    this.autocorrect = false,
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
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Expanded(child: Text(widget.label!, style: context.textTheme.labelMedium, overflow: TextOverflow.ellipsis)),
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
            inputFormatters: widget.inputFormatters ?? widget.maskUtils?.inpuFormatters,
            onChanged: () {
              if (widget.maskUtils != null && widget.maskUtils?.onChanged != null) {
                return (value) {
                  widget.maskUtils!.onChanged!.call(value);
                  widget.onChanged?.call(value);
                };
              }
              return widget.onChanged;
            }(),
            //  widget.onChanged,
            autofocus: widget.autofocus!,
            onFieldSubmitted: widget.onFieldSubmitted,
            autocorrect: widget.autocorrect!,
            cursorColor: context.color.primaryColor,
            minLines: widget.obscureText ? 1 : widget.minLines,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            validator: widget.validator ?? widget.maskUtils?.validator,
            keyboardType: widget.keyboardType ?? widget.maskUtils?.keyboardType,
            initialValue: (widget.maskUtils != null && widget.initialValue != null)
                ? Utils.maskUltisToString(widget.initialValue!, widget.maskUtils!)
                : widget.initialValue,
            autovalidateMode: () {
              if (widget.autovalidateMode != null) return widget.autovalidateMode;
              if (widget.maskUtils != null && widget.maskUtils!.autovalidateMode != null) return widget.maskUtils!.autovalidateMode;
              return null;
            }(),
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
                hintText: widget.hintText ?? widget.maskUtils?.hint),
          )
        ],
      ),
    );
    return widget.expanded ? Expanded(flex: widget.flex ?? 1, child: child) : child;
  }
}
