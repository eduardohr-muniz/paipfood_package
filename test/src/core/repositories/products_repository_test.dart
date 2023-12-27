import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  final auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = ProductsRepository(http: http);
  const String establishmentId = '22';
  const String productId = '9';

  final productMock = ProductModel(
    index: 0,
    id: uuid,
    categoryId: "",
    description: "Descrição",
    establishmentId: "establishmentId",
    complementPizzaId: "",
    name: "Name",
    updatedAt: DateTime.now(),
    isPromotional: true,
    price: 12.50,
    promotionalPrice: 12,
    qtyFlavorsPizza: QtyFlavorsPizza.one,
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, products: [productMock]);

    //Assert
    expect(result, isA<List<ProductModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(establishmentId);

    //Assert
    expect(result, isA<List<ProductModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: productId, auth: auth);
    //Assert
  });
}
