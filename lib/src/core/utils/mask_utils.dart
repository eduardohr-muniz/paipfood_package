import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paipfood_package/paipfood_package.dart';

class MaskUtils {
  //* - Validators
  ///[cRequired]--[email]--[password]--[confirmPassword]--[phonePtBr]--[cep]--[cnpj]--[cpf]
  //
  //* - functions
  ///[isValidEmail]--[isValidCnpj]--[isValidCpf]
  //
  static MaskInputController cRequired(BuildContext context) {
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
        return null;
      },
    );
  }

  static MaskInputController email(BuildContext context, {String? Function(String value)? customValidate}) {
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
      hint: "example@mail.com",
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

  static MaskInputController password(BuildContext context, {String? Function(String value)? customValidate}) {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      hint: "Insira sua senha",
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

  static MaskInputController phonePtBr(BuildContext context, {required TextEditingController textEditingController}) {
    FocusNode? focusNode;
    final maskFormatter = MaskTextInputFormatter(mask: "(##) ####-####");
    return MaskInputController(
      getFocusNode: () => null,
      inpuFormatters: [maskFormatter],
      onChanged: (value) {
        final lenght = value.length;
        if (lenght == min(13, 14)) {
          textEditingController.value = maskFormatter.updateMask(mask: lenght == 13 ? "(##) ####-#####" : "(##) ####-#####");
        }
        if (value.length >= 15) textEditingController.value = maskFormatter.updateMask(mask: "(##)# ####-####");
      },
      hint: "(00)0 0000-0000",
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          focusNode!.requestFocus();
          return "Telefone obrigatório.";
        }
        if (value.length < 16) {
          focusNode!.requestFocus();
          return "Telefone incompleto";
        }
        return null;
      },
    );
  }

  static MaskInputController cep(BuildContext context) {
    return MaskInputController(
      getFocusNode: () => null,
      inpuFormatters: [MaskTextInputFormatter(mask: "#####-###")],
      hint: "00000-000",
      textInputType: TextInputType.number,
      validator: (value) {
        if (value != null && value.length > 1 && value.length < 9) {
          return "Cep incompleto";
        }
        return null;
      },
    );
  }

  static MaskInputController cnpj(BuildContext context) {
    return MaskInputController(
      getFocusNode: () => null,
      inpuFormatters: [MaskTextInputFormatter(mask: "##.###.###/####-##")],
      hint: "00.000.000/0001-00",
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

  static MaskInputController cpf(BuildContext context) {
    return MaskInputController(
      inpuFormatters: [MaskTextInputFormatter(mask: "###.###.###-##")],
      hint: "000.000.000-00",
      textInputType: TextInputType.number,
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
