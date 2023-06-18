// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:paipfood_package/paipfood_package.dart';

class CwTextFormFild extends StatelessWidget {
  final double? maxWidthPercent;
  final String? Function(String?)? validator;
  final String? hintText;
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
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool defaultStyle;

  const CwTextFormFild({
    Key? key,
    this.maxWidthPercent,
    this.validator,
    this.hintText,
    this.srinkWrap = true,
    this.minWidth = 200,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.defaultStyle = false,
    required this.label,
    this.focusNode,
    this.expanded = false,
    this.minLines,
    this.maxLines = 1,
    this.helperText = "",
    this.prefixText,
    this.inputFormatters,
    this.controller,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthMediaQuery = maxWidthPercent != null ? context.mediaQuery.size.width * maxWidthPercent! : 0;
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          obscureText: obscureText!,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          scrollPadding: const EdgeInsets.all(20),
          cursorColor: context.primaryTextColor,
          minLines: minLines,
          maxLines: maxLines,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              enabledBorder: defaultStyle == false
                  ? UnderlineInputBorder(borderSide: BorderSide(color: context.secondaryColor, width: 2))
                  : null,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              filled: true,
              focusColor: context.primaryColor,
              hoverColor: context.primaryColor.withOpacity(0.2),
              prefixIconColor: context.primaryColor,
              prefixText: prefixText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: label,
              hintText: hintText),
        ),
        Visibility(
          visible: srinkWrap,
          child: Text(
            helperText!,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
    if (maxWidthPercent == null && expanded == false) {
      return SizedBox(
        width: minWidth,
        child: child,
      );
    } else if (maxWidthPercent == null && expanded == true) {
      return SizedBox(child: child);
    } else {
      return ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: minWidth, maxWidth: widthMediaQuery > minWidth ? widthMediaQuery : minWidth),
          child: child);
    }
  }
}
