import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paipfood_package/paipfood_package.dart';

bool _alreadyFocus = false;
Timer? _timer;

class MaskUtils {
  //* - Validators
  ///[cRequired]--[email]--[password]--[confirmPassword]--[phonePtBr]--[cep]--[cnpj]--[cpf]
  //
  //* - functions
  ///[requestFocusOnError]--[isValidEmail]--[isValidCnpj]--[isValidCpf]

  static void requestFocusOnError({required String? isError, required FocusNode? focusNode}) {
    if (_alreadyFocus == false && isError != null) {
      _alreadyFocus = true;
      focusNode?.requestFocus();
    }

    _timer?.cancel();

    _timer = Timer(100.ms, () {
      _alreadyFocus = false;
    });
  }

  static MaskInputController onlyInt({String? Function(String? value)? customValidate, bool isRequired = false}) {
    FocusNode? focusNode;

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inpuFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      validator: (value) {
        String? isError;
        if (isRequired) {
          if (value == null || value.isEmpty) {
            isError = 'Campo obrigatório';
          }
        }

        if (customValidate != null) {
          isError = customValidate.call(value);
        }
        requestFocusOnError(focusNode: focusNode, isError: isError);
        return isError;
      },
    );
  }

  static MaskInputController cRequired({String? Function(String? value)? customValidate}) {
    FocusNode? focusNode;

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String? isError;
        if (value == null || value.isEmpty) {
          isError = 'Campo obrigatório';
        }

        if (customValidate != null) {
          isError = customValidate.call(value);
        }
        requestFocusOnError(focusNode: focusNode, isError: isError);
        return isError;
      },
    );
  }

  static MaskInputController custom({required String? Function(String? value) validate, bool isRequired = false}) {
    FocusNode? focusNode;

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        String? isError;
        if (isRequired && (value == null || value.isEmpty)) {
          isError = 'Campo obrigatório';
        }

        isError = validate.call(value);

        requestFocusOnError(focusNode: focusNode, isError: isError);
        return isError;
      },
    );
  }

  static MaskInputController currencyRequired({String? Function(String value)? customValidate}) {
    FocusNode? focusNode;

    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      inpuFormatters: [CurrencyTextInputFormatter(decimalDigits: 2, locale: Intl.defaultLocale, symbol: "")],
      validator: (value) {
        String? isError;
        if (value == null || value.isEmpty) {
          isError = "Campo obrigatório";
        }
        if (customValidate != null) {
          final text = customValidate.call(value!);
          isError = text;
        }
        requestFocusOnError(focusNode: focusNode, isError: isError);
        return isError;
      },
    );
  }

  static MaskInputController currency({bool isRequired = false, String? Function(String value)? customValidate}) {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inpuFormatters: [CurrencyTextInputFormatter(decimalDigits: 2, locale: Intl.defaultLocale, symbol: "")],
      validator: (value) {
        String? isError;
        if (isRequired) {
          if (value == null || value.isEmpty) {
            isError = "Campo obrigatório";
          }
          requestFocusOnError(focusNode: focusNode, isError: isError);
        }
        if (customValidate != null) {
          final text = customValidate.call(value!);
          isError = text;
        }

        return isError;
      },
    );
  }

  static MaskInputController decimalDot({int? digitis = 1}) {
    return MaskInputController(
      inpuFormatters: [CurrencyTextInputFormatter(decimalDigits: 1, locale: 'en', symbol: "")],
    );
  }

  static MaskInputController email({required bool isRequired, String? Function(String value)? customValidate, bool isFinal = false}) {
    FocusNode? focusNode;
    bool isValidEmail(String email) {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
      return emailRegex.hasMatch(email);
    }

    return MaskInputController(
      keyboardType: TextInputType.emailAddress,
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode!;
      },
      validator: (value) {
        String? isError;
        if (isRequired) {
          if (value == null || value.isEmpty) {
            isError = "E-mail obrigatório.";
          }
        }
        if (value != null && value.isNotEmpty) {
          if (!isValidEmail(value)) {
            isError = "E-mail inválido";
          }
          if (customValidate != null) {
            final String? text = customValidate.call(value);
            if (text != null) {
              isError = text;
            }
          }
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
      },
    );
  }

  static MaskInputController password({String? Function(String value)? customValidate, bool isFinal = false}) {
    FocusNode? focusNode;
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      validator: (value) {
        String? isError;
        if (value == null || value.isEmpty) {
          isError = "Senha obrigatória";
        }
        if (value!.length < 8) {
          focusNode?.requestFocus();
          isError = "Sua senha deve conter no minimo 8 caracteres";
        }
        if (customValidate != null) {
          final String? text = customValidate.call(value);
          if (text != null) {
            focusNode?.requestFocus();
            isError = text;
          }
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
      },
    );
  }

  static MaskInputController phonePtBr({required TextEditingController textEditingController, required int minLenght}) {
    FocusNode? focusNode;
    final maskFormatter = [
      MaskTextInputFormatter(mask: "(##) ####-#############"),
    ];
    return MaskInputController(
      getFocusNode: () {
        focusNode = focusNode ?? FocusNode();
        return focusNode;
      },
      onlenghtMaskChange: 11,
      inpuFormatters: maskFormatter,
      onChanged: (value) {
        final lenght = value.length;
        if (lenght <= 13) {
          textEditingController.value = maskFormatter[0].updateMask(mask: "(##) ####-##################");
        }
        if (value.length == 14) textEditingController.value = maskFormatter[0].updateMask(mask: "(##)# ####-#################");
      },
      keyboardType: TextInputType.number,
      validator: (value) {
        String? isError;
        if (value == null || value.isEmpty) {
          isError = "Telefone obrigatório.";
        }
        if (Utils.onlyNumbersRgx(value!).length < minLenght) {
          isError = "Telefone incompleto";
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
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
        String? isError;
        if (value != null && value.length > 1 && value.length < 9) {
          isError = "Cep incompleto";
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
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
        String? isError;
        if (value == null || value.isEmpty) {
          isError = "Cnpj obrigatório.";
        }
        if (value!.length < 18) {
          isError = "Cnpj incompleto";
        }
        if (!isValidCnpj(value)) {
          isError = "Cnpj inválido";
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
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
        String? isError;
        if (value == null || value.isEmpty) {
          focusNode?.requestFocus();
          isError = "Cpf obrigatório.";
        }
        if (value!.length < 14) {
          focusNode?.requestFocus();
          isError = "Cpf incompleto";
        }
        if (!isValidCpf(value)) {
          focusNode?.requestFocus();
          isError = "Cpf inválido";
        }
        requestFocusOnError(isError: isError, focusNode: focusNode);
        return isError;
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
