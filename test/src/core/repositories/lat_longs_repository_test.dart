import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  AuthModel auth = AuthModel();
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = LatLongsRepository(http: http);
  const String establishmentId = '22';
  const String id = "4";

  final latLong = LatLongModel(
    id: uuid,
    deliveryAreaId: "",
    establishmentId: "establishmentId",
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    latLng: const LatLng(1.3, 1.5),
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, latLongs: [latLong]);

    //Assert
    expect(result, isA<List<LatLongModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId(
      establishmentId,
    );

    //Assert
    expect(result, isA<List<LatLongModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: id, auth: auth);
    //Assert
  });
}
