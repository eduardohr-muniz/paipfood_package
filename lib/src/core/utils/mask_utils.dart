import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

class MaskUtils {
  //* - Validators
  ///[cRequired]--[email]--[password]--[confirmPassword]--[phonePtBr]--[cep]--[cnpj]--[cpf]
  //
  //* - functions
  ///[isValidEmail]--[isValidCnpj]--[isValidCpf]
  //
  static MaskInputController cRequired({String? Function(String value)? customValidate}) {
    FocusNode? focusNode;

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          focusNode?.requestFocus();
          return "Campo obrigatório";
        }
        if (customValidate != null) {
          final String? text = customValidate.call(value);
          focusNode?.requestFocus();
          return text;
        }

        return null;
      },
    );
  }

  static MaskInputController email({String? Function(String value)? customValidate}) {
    FocusNode? focusNode;
    bool isValidEmail(String email) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      return emailRegex.hasMatch(email);
    }

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          focusNode?.requestFocus();
          return "E-mail obrigatório.";
        }
        if (!isValidEmail(value)) {
          focusNode?.requestFocus();
          return "E-mail inválido";
        }
        if (customValidate != null) {
          final String? text = customValidate.call(value);
          if (text != null) {
            focusNode?.requestFocus();
            return text;
          }
        }
        return null;
      },
    );
  }

  static MaskInputController password({String? Function(String value)? customValidate}) {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          focusNode?.requestFocus();
          return "Senha obrigatória";
        }
        if (value.length < 8) {
          focusNode?.requestFocus();
          return "Sua senha deve conter no minimo 8 caracteres";
        }
        if (customValidate != null) {
          final String? text = customValidate.call(value);
          if (text != null) {
            focusNode?.requestFocus();
            return text;
          }
        }
        return null;
      },
    );
  }

  static MaskInputController phonePtBr({required TextEditingController textEditingController, required int minLenght}) {
    FocusNode? focusNode;
    final maskFormatter = MaskTextInputFormatter(mask: "(##) ####-####");
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      inpuFormatters: [maskFormatter],
      onChanged: (value) {
        final lenght = value.length;
        if (lenght == min(13, 14)) {
          textEditingController.value = maskFormatter.updateMask(mask: lenght == 13 ? "(##) ####-#####" : "(##) ####-#####");
        }
        if (value.length >= 15) textEditingController.value = maskFormatter.updateMask(mask: "(##)# ####-####");
      },
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          focusNode?.requestFocus();
          return "Telefone obrigatório.";
        }
        if (Utils.onlyNumbersRgx(value).length < minLenght) {
          focusNode?.requestFocus();
          return "Telefone incompleto";
        }
        return null;
      },
    );
  }

  static MaskInputController cep() {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      inpuFormatters: [MaskTextInputFormatter(mask: "#####-###")],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value != null && value.length > 1 && value.length < 9) {
          return "Cep incompleto";
        }
        return null;
      },
    );
  }

  static MaskInputController cnpj() {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      inpuFormatters: [MaskTextInputFormatter(mask: "##.###.###/####-##")],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Cnpj obrigatório.";
        }
        if (value.length < 18) {
          return "Cnpj incompleto";
        }
        if (!isValidCnpj(value)) {
          return "Cnpj inválido";
        }
        return null;
      },
    );
  }

  static bool isValidCnpj(String cnpj) {
    // Remover caracteres não numéricos
    cnpj = cnpj.replaceAll(RegExp(r'\D'), '');
    // Verificar se possui 14 dígitos
    if (cnpj.length != 14) {
      return false;
    }
    // Verificar se todos os dígitos são iguais (caso contrário, é inválido)
    if (RegExp(r'^(\d)\1*$').hasMatch(cnpj)) {
      return false;
    }
    // Calcular o primeiro dígito verificador
    var soma = 0;
    var peso = 5;
    for (var i = 0; i < 12; i++) {
      soma += int.parse(cnpj[i]) * peso;
      peso = (peso == 2) ? 9 : peso - 1;
    }
    final digito1 = (11 - (soma % 11)) % 10;
    // Calcular o segundo dígito verificador
    soma = 0;
    peso = 6;
    for (var i = 0; i < 13; i++) {
      soma += int.parse(cnpj[i]) * peso;
      peso = (peso == 2) ? 9 : peso - 1;
    }
    final digito2 = (11 - (soma % 11)) % 10;
    // Verificar se os dígitos calculados correspondem aos dígitos informados
    return digito1 == int.parse(cnpj[12]) && digito2 == int.parse(cnpj[13]);
  }

  static MaskInputController cpf() {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      inpuFormatters: [MaskTextInputFormatter(mask: "###.###.###-##")],
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Cpf obrigatório.";
        }
        if (value.length < 14) {
          return "Cpf incompleto";
        }
        if (!isValidCpf(value)) {
          return "Cpf inválido";
        }
        return null;
      },
    );
  }

  static bool isValidCpf(String cpf) {
    // Remover caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    // Verificar se possui 11 dígitos
    if (cpf.length != 11) {
      return false;
    }
    // Verificar se todos os dígitos são iguais (caso contrário, é inválido)
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return false;
    }
    // Calcular o primeiro dígito verificador
    var soma = 0;
    for (var i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    var digito1 = (soma * 10) % 11;
    if (digito1 == 10) {
      digito1 = 0;
    }
    // Verificar o primeiro dígito verificador
    if (digito1 != int.parse(cpf[9])) {
      return false;
    }
    // Calcular o segundo dígito verificador
    soma = 0;
    for (var i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    var digito2 = (soma * 10) % 11;
    if (digito2 == 10) {
      digito2 = 0;
    }
    // Verificar o segundo dígito verificador
    if (digito2 != int.parse(cpf[10])) {
      return false;
    }
    // CPF válido
    return true;
  }
}

class AlphaNumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: Utils.onlyAlphanumeric(newValue.text, undereline: true),
      selection: newValue.selection,
    );
  }
}
