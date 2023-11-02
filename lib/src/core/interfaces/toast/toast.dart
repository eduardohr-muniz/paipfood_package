import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

import 'i_toast.dart';

class Toast implements IToast {
  final BuildContext context;
  Toast._(this.context);

  factory Toast.of(BuildContext context) {
    return Toast._(context);
  }
  late final Toastification? toast;

  @override
  void showError(String message, {String? label}) => _showMessage(
        label: label ?? "Error",
        message: message,
        color: context.color.errorColor,
        icon: Icon(
          Icomoon.close_circle,
          color: context.color.errorColor,
        ),
      );

  @override
  void showInfo(String message, {String? label}) => _showMessage(
        label: label ?? "Info",
        message: message,
        color: Colors.blue,
        icon: const Icon(
          Icomoon.info_circle,
          color: Colors.blue,
        ),
      );

  @override
  void showSucess(String message, {String? label}) => _showMessage(
        label: label ?? "Sucess",
        message: message,
        color: context.color.primaryColor,
        icon: Icon(Icomoon.tick_circle, color: context.color.primaryColor),
      );
  @override
  void showCustom(String message, {String? label, Color? color, Widget? icon}) => _showMessage(
        label: label ?? "Custom",
        message: message,
        color: color ?? Colors.black,
        icon: icon ?? const Icon(Icomoon.info_circle, color: Colors.black),
      );

  Duration calculeDuration(String message) {
    final int lenght = message.split(" ").length;

    final int miliseconds = lenght * 400;
    if (miliseconds < 4000) return const Duration(seconds: 4);
    return Duration(milliseconds: miliseconds);
  }

  void _showMessage({required String label, required String message, required Color color, Widget? icon}) {
    toastification.show(
        context: context,
        title: label,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: calculeDuration(message),
        backgroundColor: context.color.onPrimaryBG,
        primaryColor: color,
        foregroundColor: context.color.primaryText,
        borderRadius: BorderRadius.circular(4),
        dragToClose: true,
        showProgressBar: true,
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.35),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
        description: message,
        closeButtonShowType: CloseButtonShowType.always,
        icon: icon,
        pauseOnHover: true,
        progressBarTheme: ProgressIndicatorThemeData(
          color: color,
          linearTrackColor: Colors.grey.shade600,
        ));
  }
}
