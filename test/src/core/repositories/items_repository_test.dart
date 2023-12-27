import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  //TODO EHM: TESTE
  const email = "eduardohr.muniz@gmail.com";
  AuthModel auth = AuthModel();
  final http = HttpDio(autoToast: false);
  final authRepository = AuthRepository(http: http);
  if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = ItemsRepository(http: http);
  const String establishmentId = '22';
  const String itemId = '2';

  final itemMock = ItemModel(
      id: uuid,
      complementId: "",
      establishmentId: "establishmentId",
      description: "Descrição",
      index: 0,
      name: "Name",
      updatedAt: DateTime.now(),
      price: 12.50,
      promotionalPrice: 12,
      nickName: "teste",
      visible: true,
      itemtype: Itemtype.pizza);

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, items: [itemMock]);

    //Assert
    expect(result, isA<List<ItemModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(establishmentId);

    //Assert
    expect(result, isA<List<ItemModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: itemId, auth: auth);
    //Assert
  });
}
