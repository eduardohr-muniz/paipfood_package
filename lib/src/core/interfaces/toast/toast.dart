import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class Toast implements IToast {
  final BuildContext context;
  Toast._(this.context);

  factory Toast.of(BuildContext context) {
    return Toast._(context);
  }
  late final Toastification? toast;

  @override
  void showError(String message, {String? label, Alignment? alignment}) => _showMessage(
        label: label ?? "Error",
        message: message,
        color: context.color.errorColor,
        icon: Icon(
          Icomoon.close_circle,
          color: context.color.errorColor,
        ),
      );

  @override
  void showInfo(String message, {String? label, Alignment? alignment}) => _showMessage(
        label: label ?? "Info",
        message: message,
        color: context.color.tertiaryColor,
        icon: Icon(
          Icomoon.info_circle,
          color: context.color.tertiaryColor,
        ),
      );

  @override
  void showSucess(String message, {String? label, Alignment? alignment}) => _showMessage(
        label: label ?? "Sucess",
        message: message,
        color: context.color.primaryColor,
        icon: Icon(Icomoon.tick_circle, color: context.color.primaryColor),
      );
  @override
  void showCustom(String message, {String? label, Color? color, Widget? icon, Alignment? alignment}) => _showMessage(
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

  void _showMessage(
      {required String label, required String message, required Color color, Widget? icon, Color? backGroundColor, Alignment? alignment}) {
    toastification.show(
        context: context,
        title: Text(label),
        style: ToastificationStyle.flatColored,
        autoCloseDuration: calculeDuration(message),
        backgroundColor: backGroundColor ?? context.color.onPrimaryBG,
        primaryColor: color,
        foregroundColor: context.color.primaryText,
        borderRadius: BorderRadius.circular(4),
        dragToClose: true,
        alignment: alignment ?? Alignment.topRight,
        showProgressBar: true,
        boxShadow: [],
        description: Text(message),
        closeButtonShowType: CloseButtonShowType.always,
        icon: icon,
        pauseOnHover: true,
        progressBarTheme: ProgressIndicatorThemeData(
          color: color,
          linearTrackColor: Colors.grey.shade600,
        ));
  }
}
