import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MaskInputController {
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inpuFormatters;
  final int? onlenghtMaskChange;
  final String? hint;
  final TextInputType? keyboardType;
  final FocusNode? Function()? getFocusNode;
  final void Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;

  MaskInputController({
    this.validator,
    this.inpuFormatters,
    this.onlenghtMaskChange,
    this.hint,
    this.keyboardType,
    this.getFocusNode,
    this.onChanged,
    this.autovalidateMode,
  });

  MaskInputController copyWith({
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inpuFormatters,
    int? onlenghtMaskChange,
    String? hint,
    TextInputType? keyboardType,
    FocusNode? Function()? getFocusNode,
    void Function(String value)? onChanged,
    AutovalidateMode? autovalidateMode,
  }) {
    return MaskInputController(
      validator: validator ?? this.validator,
      inpuFormatters: inpuFormatters ?? this.inpuFormatters,
      onlenghtMaskChange: onlenghtMaskChange ?? this.onlenghtMaskChange,
      hint: hint ?? this.hint,
      keyboardType: keyboardType ?? this.keyboardType,
      getFocusNode: getFocusNode ?? this.getFocusNode,
      onChanged: onChanged ?? this.onChanged,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
    );
  }
}
