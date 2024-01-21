import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@outlook.com";
  final http = HttpDio();
  final authRepository = AuthRepository(http: http);
  final auth = await authRepository.loginByEmail(email: email, password: "AleGraivos@8");
  final repository = CategoriesRepository(http: http);

  const String establishmentId = "26c6c358-ef75-40c1-9be2-19a9bbce45a5";
  final categoryMock = CategoryModel(
    products: [],
    id: uuid,
    description: "Descrição",
    establishmentId: establishmentId,
    index: 0,
    name: "Name",
    updatedAt: DateTime.now(),
  );

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.upsert(auth: auth, categories: [categoryMock]);

    //Assert
    expect(result, isA<List<CategoryModel>>());
  });

  test('getByEstablishmentId', () async {
    //Arrange

    //Act
    final result = await repository.getByEstablishmentId('');

    //Assert
    expect(result, isA<List<CategoryModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: categoryMock.id, auth: auth);
    //Assert
  });
}
