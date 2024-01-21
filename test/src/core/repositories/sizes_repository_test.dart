import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  //TODO EHM: TESTE
  const email = "eduardohr.muniz@gmail.com";
  AuthModel auth = AuthModel();
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = SizesRepository(http: http);
  const String establishmentId = '22';
  const String sizeId = '9';

  final sizeMock = SizeModel(
    id: uuid,
    establishmentId: "establishmentId",
    updatedAt: DateTime.now(),
    price: 12.50,
    promotionalPrice: 12,
    createdAt: DateTime.now(),
    itemId: "",
    productId: "",
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, sizes: [sizeMock]);

    //Assert
    expect(result, isA<List<SizeModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(
      establishmentId,
    );

    //Assert
    expect(result, isA<List<SizeModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: sizeId, auth: auth);
    //Assert
  });
}
