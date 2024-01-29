import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum PaymentFlagEnum {
  money,
  amex,
  diners,
  elo,
  hiper,
  master,
  pix,
  visa,
  vrAlimentacao,
  vrRefeicao;

  static PaymentFlagEnum fromMap(String value) {
    return PaymentFlagEnum.values.firstWhere((element) => element.name == value);
  }

  static String pathIcon(PaymentFlagEnum paymentEnum) => 'assets/payments/${paymentEnum.name}.svg';
}

enum PaymentType {
  credit,
  debit,
  voucher,
  foodTicket,
  mealTicket,
  money,
  pix;

  static PaymentType fromMap(String value) {
    return PaymentType.values.firstWhere((element) => element.name == value);
  }
}

enum PixEnum {
  cpf(label: "CPF", mask: "###.###.###-##"),
  cnpj(label: "CNPJ", mask: "##.###.###/####-##"),
  telefone(label: "Telefone", mask: "(##)# ####-####"),
  email(label: "E-mail"),
  aleatoria(label: "Aleatória");

  final String label;
  final String? mask;
  const PixEnum({required this.label, this.mask});

  static PixEnum fromMap(String value) {
    return PixEnum.values.firstWhere((element) => element.name == value);
  }

  static Map<String, dynamic> toMap({required PixEnum pix, required String key}) {
    return {
      'method': 'pix',
      'key': key,

      /// classe de dados bancarios
      'type': pix,
    };
  }
}
