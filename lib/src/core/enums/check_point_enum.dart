enum OrderTypeEnum {
  delivery("entrega"),
  pickUp("retirada"),
  consume("consumo"),
  kiosk("kiosk"),
  table("mesa");

  final String i18nText;

  const OrderTypeEnum(this.i18nText);

  static OrderTypeEnum fromMap(String value) {
    return OrderTypeEnum.values.firstWhere((element) => element.name == value);
  }
}

// enum OrderStatus {
//   peding,
//   awaitingPayment,
//   paid,
//   paymentRejected,
//   canceled,
//   lost;

//   static OrderStatus fromMap(String value) {
//     return OrderStatus.values.firstWhere((element) => element.name == value);
//   }
// }
