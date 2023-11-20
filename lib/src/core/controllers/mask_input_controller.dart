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

  /// implementar [mask]
  final MaskTextInputFormatter? mask;

  /// implementar [changeMask]
  final Function(String value, MaskTextInputFormatter mask)? changeMask;

  MaskInputController({
    this.getFocusNode,
    this.hint,
    this.textInputType,
    this.mask,
    this.validator,
    this.inpuFormatters,
    this.changeMask,
  });

  MaskInputController copyWith({
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inpuFormatters,
    String? hint,
    TextInputType? textInputType,
    FocusNode? Function()? getFocusNode,
    MaskTextInputFormatter? mask,
    Function(String value, MaskTextInputFormatter mask)? changeMask,
  }) {
    return MaskInputController(
      validator: validator ?? this.validator,
      inpuFormatters: inpuFormatters ?? this.inpuFormatters,
      hint: hint ?? this.hint,
      textInputType: textInputType ?? this.textInputType,
      getFocusNode: getFocusNode ?? this.getFocusNode,
      mask: mask ?? this.mask,
      changeMask: changeMask ?? this.changeMask,
    );
  }
}
