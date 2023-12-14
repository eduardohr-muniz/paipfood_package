import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/categories/categories_repository.dart';

Future<void> main() async {
  const email = "eduardohr.muniz@gmail.com";
  final http = HttpDio(autoToast: false);
  final authRepository = AuthRepository(http: http);
  final auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = CategoriesRepository(http: http);
  const int? categoryId = null;
  const int establishmentId = 22;
  final categoryMock = CategoryModel(
    description: "Descrição",
    establishmentId: 22,
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
    final result = await repository.getByEstablishmentId(establishmentId);

    //Assert
    expect(result, isA<List<CategoryModel>>());
  });

  test('delete', () async {
    //Arrange

    //Act
    await repository.delete(id: categoryId!, auth: auth);
    //Assert
  });
}
