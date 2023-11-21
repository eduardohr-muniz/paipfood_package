import 'package:flutter/widgets.dart';

enum FlagsEnum {
  ptBR(FlagModel.labelPTbr, FlagModel.pathPTbr, FlagModel.localePTbr),
  pt(FlagModel.labelPT, FlagModel.pathPT, FlagModel.localePT),
  us(FlagModel.labelUs, FlagModel.pathUs, FlagModel.localeUs);

  final String label;
  final String pathFlage;
  final Locale locale;

  const FlagsEnum(this.label, this.pathFlage, this.locale);
}

class FlagModel {
  final String label;
  final String pathFlage;
  final String i18n;
  FlagModel({
    required this.label,
    required this.pathFlage,
    required this.i18n,
  });

  static const pathPTbr = "assets/flags/BR.png";
  static const labelPTbr = "Português BR";
  static const localePTbr = Locale("pt", "BR");
  //
  static const pathPT = "assets/flags/PT.png";
  static const labelPT = "Português";
  static const localePT = Locale("pt");
  //
  static const pathUs = "assets/flags/US.png";
  static const labelUs = "English";
  static const localeUs = Locale("en");
}
