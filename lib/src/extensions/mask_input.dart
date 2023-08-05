part of '../../paipfood_package.dart';

class MaskInputModel {
  final FormFieldValidator<String>? validator;
  final MaskTextInputFormatter? mask;
  final String hint;
  final Function(String value, MaskTextInputFormatter mask)? changeMask;
  final TextInputType textInputType;
  final FocusManager? focusNode;
  MaskInputModel({
    this.validator,
    this.mask,
    required this.hint,
    this.changeMask,
    required this.textInputType,
    this.focusNode,
  });
}

class MaskInput {
  MaskInputModel email = MaskInputModel(
    hint: "example@mail.com",
    textInputType: TextInputType.number,
    validator: (value) {
      bool isValidEmail(String email) {
        final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
        return emailRegex.hasMatch(email);
      }

      if (value == null || value.isEmpty) {
        return "E-mail obrigatório.";
      }
      if (!isValidEmail(value)) {
        return "E-mail inválido";
      }
      return null;
    },
  );

  MaskInputModel password = MaskInputModel(
    hint: "Insira sua senha",
    textInputType: TextInputType.number,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Senha obrigatória";
      }
      if (value.length < 8) {
        return "Sua senha deve conter no minimo 8 caracteres";
      }
      return null;
    },
  );

  MaskInputModel phonePtBr = MaskInputModel(
    mask: MaskTextInputFormatter(mask: "(##) ####-####"),
    changeMask: (value, mask) {
      if (value.length == 14) mask.updateMask(mask: "(##)# ####-####");
      if (value.length == 13) mask.updateMask(mask: "(##) ####-####");
    },
    hint: "(00) 0 0000-0000",
    textInputType: TextInputType.number,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Telefone obrigatório.";
      }
      if (value.length < 16) {
        return "Telefone incompleto";
      }
      return null;
    },
  );

  MaskInputModel cep = MaskInputModel(
    mask: MaskTextInputFormatter(mask: "#####-###"),
    hint: "00000-000",
    textInputType: TextInputType.number,
    validator: (value) {
      if (value != null && value.length > 1 && value.length < 9) {
        return "Cep incompleto";
      }
      return null;
    },
  );
  MaskInputModel get cnpj => MaskInputModel(
        mask: MaskTextInputFormatter(mask: "##.###.###/####-##"),
        hint: "00.000.000/0001-00",
        textInputType: TextInputType.number,
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
  bool isValidCnpj(String cnpj) {
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
    var digito1 = (11 - (soma % 11)) % 10;
    // Calcular o segundo dígito verificador
    soma = 0;
    peso = 6;
    for (var i = 0; i < 13; i++) {
      soma += int.parse(cnpj[i]) * peso;
      peso = (peso == 2) ? 9 : peso - 1;
    }
    var digito2 = (11 - (soma % 11)) % 10;
    // Verificar se os dígitos calculados correspondem aos dígitos informados
    return digito1 == int.parse(cnpj[12]) && digito2 == int.parse(cnpj[13]);
  }

  MaskInputModel get cpf => MaskInputModel(
        mask: MaskTextInputFormatter(mask: "###.###.###-##"),
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
  bool isValidCpf(String cpf) {
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

// String decimalFormat(String value) {
//   String text = value;
//   text = text.replaceAll(RegExp(r'[a-zA-Z]'), '');

//   // Remover todos os pontos e vírgulas
//   text = text.replaceAll('.', '');
//   text = text.replaceAll(',', '');
//   text = text.replaceAll('-', '');
//   text = text.replaceAll('+', '');

//   // Encontrar o índice do ponto decimal
//   int decimalIndex = text.length - 2;

//   // Verifica se ha mais de duas casas decimais
//   if (decimalIndex < 0) {
//     decimalIndex = 0;
//   } else {
//     decimalIndex = text.length - 2;
//   }

//   // Adiciona o ponto para separar milhares
//   int thousandsSeparator = decimalIndex > 0 ? decimalIndex - 3 : text.length - 3;
//   while (thousandsSeparator > 0) {
//     text = '${text.substring(0, thousandsSeparator)}.${text.substring(thousandsSeparator)}';
//     thousandsSeparator -= 3;
//   }
//   // Insere a virgula para separar o decimal
//   text.length > 3
//       ? text = '${text.substring(0, text.length - 2)},${text.substring(text.length - 2, text.length)}'
//       : text = '${text.substring(0, decimalIndex)},${text.substring(decimalIndex)}';

//   // Adicona o 0 no inicio e tira deposi que sai da casa de centavos
//   if (text.length == 2) {
//     text = "0$text";
//   } else if (text.length == 5) {
//     text = text.replaceFirst("0", "");
//   }

//   // Se for vazio setamo vazio
//   if (text == ',' || text.isEmpty) {
//     text = '';
//   }
//   return text;
// }

class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) () => newValue;
    String result = formatNumberPtbr(newValue.text);
    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}

var numberFormat = NumberFormat("#,###,##", "pt_BR");

String formatNumberPtbr(String value) {
  String regex = value.replaceAll(RegExp(r"[^0-9]"), "");
  int toNumber = int.tryParse(regex) ?? 0;
  String text = numberFormat.format(toNumber).toString();
  return text.replaceFirstMapped(RegExp(r'\.(?=[^.]*$)'), (match) => ',');
}
