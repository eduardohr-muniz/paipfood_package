import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../paipfood_package.dart';

class MaskInputController {
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inpuFormatters;
  final String? hint;
  final TextInputType? textInputType;
  final FocusNode? Function()? getFocusNode;
  final void Function(String value)? onChanged;

  /// implementar [mask]
  final MaskTextInputFormatter? mask;

  /// implementar [changeMask]

  MaskInputController({
    this.getFocusNode,
    this.hint,
    this.textInputType,
    this.mask,
    this.validator,
    this.inpuFormatters,
    this.onChanged,
  });

  MaskInputController copyWith({
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inpuFormatters,
    String? hint,
    TextInputType? textInputType,
    FocusNode? Function()? getFocusNode,
    void Function(String value)? onChanged,
    MaskTextInputFormatter? mask,
  }) {
    return MaskInputController(
      validator: validator ?? this.validator,
      inpuFormatters: inpuFormatters ?? this.inpuFormatters,
      hint: hint ?? this.hint,
      textInputType: textInputType ?? this.textInputType,
      getFocusNode: getFocusNode ?? this.getFocusNode,
      onChanged: onChanged ?? this.onChanged,
      mask: mask ?? this.mask,
    );
  }
}
