import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/categories/categories_repository.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  final http = HttpDio(autoToast: false);
  final authRepository = AuthRepository(http: http);
  final auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = ProductsRepository(http: http);
  const int establishmentId = 22;
  int productId = 9;

  final productMock = ProductModel(
    id: productId,
    categoryId: 6,
    description: "Descrição",
    establishmentId: establishmentId,
    index: 0,
    name: "Name",
    updatedAt: DateTime.now(),
    isPromotional: true,
    price: 12.50,
    promotionalPrice: 12,
    qtyFlavorsPizza: QtyFlavorsPizza.one,
    visible: false,
  );

  test('insert', () async {
    //Arrange

    //Act
    final result = await repository.insert(auth: auth, product: productMock);
    productId = result.id!;
    //Assert
    expect(result, isA<ProductModel>());
  });

  test('update', () async {
    //Arrange

    //Act
    final result = await repository.update(auth: auth, product: productMock);
    //Assert
    expect(result, isA<ProductModel>());
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
