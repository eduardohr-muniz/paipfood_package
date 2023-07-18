// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:paipfood_package/paipfood_package.dart';

class CwTextFormFild extends StatefulWidget {
  final TextEditingController controller;
  final String? initialValue;
  final double? maxWidthPercent;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool filled;
  final bool srinkWrap;
  final double minWidth;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String label;
  final FocusNode? focusNode;
  final bool? expanded;
  final int? minLines;
  final int? maxLines;
  final String? helperText;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool defaultStyle;

  const CwTextFormFild({
    Key? key,
    required this.controller,
    this.initialValue,
    this.maxWidthPercent,
    this.validator,
    this.hintText,
    this.filled = true,
    this.srinkWrap = true,
    this.minWidth = 200,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    required this.label,
    this.focusNode,
    this.expanded = false,
    this.minLines,
    this.maxLines = 1,
    this.helperText = "",
    this.prefixText,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType,
    this.defaultStyle = false,
  }) : super(key: key);

  @override
  State<CwTextFormFild> createState() => _CwTextFormFildState();
}

class _CwTextFormFildState extends State<CwTextFormFild> {
  @override
  void initState() {
    if (widget.initialValue != null) widget.controller.text = widget.initialValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthMediaQuery = widget.maxWidthPercent != null ? context.mediaQuery.size.width * widget.maxWidthPercent! : 0;
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          obscureText: widget.obscureText!,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          scrollPadding: const EdgeInsets.all(20),
          cursorColor: context.primaryTextColor,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              enabledBorder: widget.defaultStyle == false
                  ? UnderlineInputBorder(borderSide: BorderSide(color: context.secondaryColor, width: 2))
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              filled: true,
              fillColor: widget.filled ? context.primaryBgColor : null,
              focusColor: context.primaryColor,
              hoverColor: context.primaryColor.withOpacity(0.2),
              prefixIconColor: context.primaryColor,
              prefixText: widget.prefixText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              labelText: widget.label,
              hintText: widget.hintText),
        ),
        Visibility(
          visible: widget.srinkWrap,
          child: Text(
            widget.helperText!,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
    if (widget.maxWidthPercent == null && widget.expanded == false) {
      return SizedBox(
        width: widget.minWidth,
        child: child,
      );
    } else if (widget.maxWidthPercent == null && widget.expanded == true) {
      return SizedBox(child: child);
    } else {
      return ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: widget.minWidth, maxWidth: widthMediaQuery > widget.minWidth ? widthMediaQuery : widget.minWidth),
          child: child);
    }
  }
}
