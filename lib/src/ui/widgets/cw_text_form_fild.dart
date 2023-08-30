// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:paipfood_package/paipfood_package.dart';

class CwTextFormFild extends StatefulWidget {
  final TextEditingController controller;
  final String? initialValue;
  final ValueListenable<bool>? updateInitialValueVN;
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
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool defaultStyle;
  final bool filled;

  const CwTextFormFild({
    Key? key,
    required this.controller,
    this.initialValue,
    this.updateInitialValueVN,
    this.maxWidthPercent,
    this.validator,
    this.hintText,
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
    this.filled = true,
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

  bool _update = false;

  @override
  Widget build(BuildContext context) {
    final double widthMediaQuery = widget.maxWidthPercent != null ? context.w * widget.maxWidthPercent! : 0;
    Widget child = Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(widget.label, style: context.textTheme.labelMedium, maxLines: 1),
          ),
          TextFormField(
            focusNode: widget.focusNode,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            scrollPadding: const EdgeInsets.all(20),
            cursorColor: context.primaryColor,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.primaryBgColor)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: context.primaryBgColor)),
                filled: widget.filled,
                isDense: true,
                fillColor: context.primaryBgColor,
                // labelStyle: const TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: context.secondaryColor),
                // focusColor: context.primaryColor,
                // hoverColor: context.primaryColor.withOpacity(0.1),
                prefixIconColor: context.primaryColor,
                prefixText: widget.prefixText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                // labelText: widget.label,
                hintText: widget.hintText),
          ),
        ],
      ),
    );

    Widget valueLB = widget.updateInitialValueVN != null
        ? ValueListenableBuilder(
            valueListenable: widget.updateInitialValueVN!,
            builder: (context, update, _) {
              if (_update != update) {
                widget.controller.text = widget.initialValue!;
                _update = update;
              }
              return child;
            },
          )
        : const SizedBox.shrink();

    if (widget.maxWidthPercent == null && widget.expanded == false) {
      return SizedBox(
        width: widget.minWidth,
        child: widget.updateInitialValueVN != null ? valueLB : child,
      );
    } else if (widget.maxWidthPercent == null && widget.expanded == true) {
      return SizedBox(child: widget.updateInitialValueVN != null ? valueLB : child);
    } else {
      return ConstrainedBox(
          constraints: BoxConstraints(minWidth: widget.minWidth, maxWidth: widthMediaQuery > widget.minWidth ? widthMediaQuery : widget.minWidth),
          child: widget.updateInitialValueVN != null ? valueLB : child);
    }
  }
}
