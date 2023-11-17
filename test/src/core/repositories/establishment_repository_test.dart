import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/establishment_repository.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final repository = EstablishmentRepository(http: http);

  const String email = "eduardohr.muniz@gmail.com";
  test('getCompanies', () async {
    //Arrange
    final request = await repository.getCompanies();
    //Act
    expect(request, isA<List<CompanyModel>>());
    //Assert
  });
  test('getCompanyBySlug', () async {
    //Arrange
    final request = await repository.getCompanyBySlug(slug: "paipfood");
    final requestNull = await repository.getCompanyBySlug(slug: "p");
    //Act
    expect(request, isA<CompanyModel>());
    //Assert
    expect(requestNull, null);
  });
  test('getEstablishments', () async {
    //Arrange
    final request = await repository.getEstablishments(range: RangeModel());
    //Act
    expect(request, isA<List<EstablishmentModel>>());
    //Assert
  });
  test('getEstablishmentById', () async {
    //Arrange
    final request = await repository.getEstablishmentById(id: 5);
    final requestNull = await repository.getEstablishmentById(id: 1);
    //Act
    expect(request, isA<EstablishmentModel>());
    //Assert
    expect(requestNull, null);
  });
}
