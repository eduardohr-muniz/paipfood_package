import 'package:flutter/material.dart';

import 'package:paipfood_package/paipfood_package.dart';

class CwButton extends StatefulWidget {
  final IconData? icon;
  final String label;
  final bool enable;
  final void Function()? onPressed;
  final Future Function()? onPressedFuture;
  final Color color;
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
      icon: widget.icon != null
          ? Icon(
              widget.icon,
              color: Colors.white,
            )
          : const SizedBox.shrink(),
      label: ValueListenableBuilder(
          valueListenable: load,
          builder: (context, isLoad, _) {
            if (isLoad) {
              return const SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ));
            }

            return Text(
              widget.label,
              style: TextStyle(color: PColors.light.primaryBG),
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
            print(e.toString());
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
        minimumSize: const Size(60, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
