enum FlagsEnum {
  ptBR(FlagModel.labelPTbr, FlagModel.pathPTbr, FlagModel.i18nPTbr),
  pt(FlagModel.labelPT, FlagModel.pathPT, FlagModel.i18nPT),
  us(FlagModel.labelUs, FlagModel.pathUs, FlagModel.i18nUs);

  final String label;
  final String pathFlage;
  final String i18n;

  const FlagsEnum(this.label, this.pathFlage, this.i18n);
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

  static const pathPTbr = "assets/pt_BR.svg";
  static const labelPTbr = "Português BR";
  static const i18nPTbr = "pt_BR";
  //
  static const pathPT = "assets/pt.svg";
  static const labelPT = "Português";
  static const i18nPT = "pt";
  //
  static const pathUs = "assets/en.svg";
  static const labelUs = "English";
  static const i18nUs = "en";
}
