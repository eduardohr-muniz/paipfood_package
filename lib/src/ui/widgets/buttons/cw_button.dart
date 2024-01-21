import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwButton extends StatefulWidget {
  final IconData? icon;
  final String label;
  final bool enable;
  final void Function()? onPressed;
  final Future Function()? onPressedFuture;
  final Color color;
  final Color? colorText;
  final bool autoToast;
  final String? errorGeneric;
  const CwButton({
    required this.label,
    this.onPressed,
    this.onPressedFuture,
    this.enable = true,
    Key? key,
    this.icon,
    this.color = PColors.primaryColor_,
    this.autoToast = true,
    this.errorGeneric,
    this.colorText,
  }) : super(key: key);

  @override
  State<CwButton> createState() => _CwButtonState();
}

class _CwButtonState extends State<CwButton> {
  bool _enable = true;
  var load = ValueNotifier(false);

  @override
  void initState() {
    _enable = widget.enable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: ValueListenableBuilder(
        valueListenable: load,
        builder: (context, value, child) {
          if (value || widget.icon == null) return const SizedBox.shrink();
          return Icon(
            widget.icon,
            color: widget.colorText ?? Colors.white,
          );
        },
      ),
      label: ValueListenableBuilder(
          valueListenable: load,
          builder: (context, isLoad, _) {
            if (isLoad) {
              return SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    color: widget.colorText ?? Colors.white,
                    strokeWidth: 3,
                  ));
            }

            return Text(
              widget.label,
              style: TextStyle(color: widget.colorText ?? PColors.light.primaryBG),
            ).center;
          }),
      onPressed: () async {
        if (_enable == false) return;
        if (widget.onPressedFuture != null && widget.enable) {
          _enable = false;
          load.value = true;

          try {
            await widget.onPressedFuture?.call();
          } catch (e) {
            if (widget.autoToast) toast.showError(widget.errorGeneric ?? e.toString());
          }

          load.value = false;
          _enable = true;
        } else if (widget.enable) {
          try {
            widget.onPressed?.call();
          } catch (e) {
            if (widget.autoToast) toast.showError(e.toString());
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        minimumSize: const Size(50, 45),
        // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
