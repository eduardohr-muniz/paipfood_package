import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/order/order_repository.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  final auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = OrderRepository(http: http);
  const String establishmentId = '26c6c358-ef75-40c1-9be2-19a9bbce45a5';

  final productMock = ProductModel(
    index: 0,
    id: uuid,
    categoryId: "",
    description: "Descrição",
    establishmentId: "establishmentId",
    name: "Name",
    updatedAt: DateTime.now(),
    price: 12.50,
    promotionalPrice: 12,
    qtyFlavorsPizza: QtyFlavorsPizza.one,
    complementsIds: [],
    complements: [],
    sizes: [],
  );
  final orderMock = OrderModel(
    id: uuid,
    establishmentId: establishmentId,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    cartProducts: [
      CartProductVm(id: uuid, product: productMock, itemsCartMap: {}),
    ],
    customer: CustomerModel(addresses: []),
    orderType: OrderTypeEnum.delivery,
    paymentMethod: PaymentMethodModel(
        id: "b35c40cf-d69c-426e-9498-1b02d854b25d",
        createdAt: DateTime.now(),
        countryId: "Brasil",
        isApp: false,
        paymentFlag: PaymentFlagEnum.money,
        isLocal: true,
        paymentType: PaymentType.money,
        name: "Dinheiro"),
    amount: 12.50,
    changeTo: 50,
    orderNumber: 100,
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(orders: [orderMock], auth: auth);

    //Assert
    expect(result, isA<List<OrderModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(establishmentId);

    //Assert
    expect(result, isA<List<OrderModel>>());
  });

  // test('delete', () async {
  //   //Arrange

  //   //Act
  //   await repository.delete(id: productId, auth: auth);
  //   //Assert
  // });
}
