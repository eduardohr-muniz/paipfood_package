import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../paipfood_package.dart';

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
    ValueGetter<FormFieldValidator<String>?>? validator,
    ValueGetter<List<TextInputFormatter>?>? inpuFormatters,
    ValueGetter<String?>? hint,
    ValueGetter<TextInputType?>? textInputType,
  }) {
    return MaskInputController(
      validator: validator != null ? validator() : this.validator,
      inpuFormatters: inpuFormatters != null ? inpuFormatters() : this.inpuFormatters,
      hint: hint != null ? hint() : this.hint,
      textInputType: textInputType != null ? textInputType() : this.textInputType,
    );
  }
}
