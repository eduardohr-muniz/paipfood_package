enum OrderTypeEnum {
  delivery("entrega"),
  pickUp("retirada"),
  consume("consumo"),
  kiosk("kiosk"),
  table("mesa");

  final String i18Name;

  const OrderTypeEnum(this.i18Name);

  static OrderTypeEnum fromMap(String value) {
    return OrderTypeEnum.values.firstWhere((element) => element.name == value);
  }
}

enum StatusOrder {
  peding,
  awaitingPayment,
  paid,
  paymentRejected,
  canceled,
  lost,
}
