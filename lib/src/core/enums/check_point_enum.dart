enum CheckPointEnum {
  establishment,
  delivery,
  kiosk,
  table;

  static CheckPointEnum fromMap(String value) {
    return CheckPointEnum.values.firstWhere((element) => element.name == value);
  }
}
