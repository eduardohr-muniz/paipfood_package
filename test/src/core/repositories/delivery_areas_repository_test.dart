import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  AuthModel auth = AuthModel();
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = DeliveryAreasRepository(http: http);
  const String establishmentId = '26c6c358-ef75-40c1-9be2-19a9bbce45a5';
  final String id = uuid;

  final areaMock = DeliveryAreasModel(
    id: id,
    establishmentId: "establishmentId",
    latLongs: [],
    updatedAt: DateTime.now(),
    price: 12.50,
    createdAt: DateTime.now(),
    label: "Teste",
    radius: 5.0,
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, areas: [areaMock]);
    //Assert
    expect(result, isA<List<DeliveryAreasModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(
      establishmentId,
    );

    //Assert
    expect(result, isA<List<DeliveryAreasModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: id, auth: auth, isDeleted: true);
    //Assert
  });
  test('getdeliveryareabylatlong', () async {
    //Arrange

    //Act
    final result = await repository.getDeliveryAreaByLatLong(establishmentId: establishmentId, lat: -21.7984488, long: -46.5284425);
    //Assert
    expect(result, isA<DeliveryAreasModel>());
  });
}
