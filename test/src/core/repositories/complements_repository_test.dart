import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  AuthModel auth = AuthModel();
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = ComplementsRepository(http: http);

  final complementMock = ComplementModel(
    id: uuid,
    establishmentId: "establishmentId",
    index: 0,
    name: "Name",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    identifier: "teste",
    visible: false,
    complementType: ComplementType.pizza,
    qtyMax: 2,
    qtyMin: 1,
    items: [],
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, complements: [complementMock]);

    //Assert
    expect(result, isA<List<ComplementModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId('establishmentId');

    //Assert
    expect(result, isA<List<ComplementModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: complementMock.id, auth: auth);
    //Assert
  });
}
