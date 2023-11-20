enum CulinaryStyleEnum {
  bar,
  bistro,
  buffet,
  coffe,
  italian,
  steakHouse,
  homemadeFood,
  fastFood,
  healthyFood,
  creperie,
  arabic,
  emporium,
  supermarket,
  oriental,
  japonese,
  chinese,
  seafood,
  burguer,
  pizzeria,
  iceCream,
  bakery,
  sandwiches,
  juices,
  pharmacy;

  static CulinaryStyleEnum fromMap(String value) {
    return CulinaryStyleEnum.values.firstWhere((element) => element.name == value);
  }
}
