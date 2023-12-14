import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final repository = EstablishmentRepository(http: http);
  final authRepository = AuthRepository(http: http);
  CompanyModel companyMock = CompanyModel(slug: "paipfood");
  EstablishmentModel establishmentMock = EstablishmentModel(fantasyName: "Teste", id: 16);

  const String email = "eduardohr.muniz@gmail.com";
  group('GET establishmentRepository', () {
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
      final request = await repository.getEstablishmentsBySlug(companyMock.slug!);
      //Act
      expect(request, isA<List<EstablishmentModel>>());
      //Assert
    });

    test('getEstablishmentById', () async {
      //Arrange
      final request = await repository.getEstablishmentById(id: 22);
      final requestNull = await repository.getEstablishmentById(id: 1);
      //Act
      expect(request, isA<EstablishmentModel>());
      //Assert
      expect(requestNull, null);
    });
  });

  test('createCompany', () async {
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    //Act
    final request = await repository.insertCompany(auth: user, company: companyMock);
    //Assert
    expect(request, isA<CompanyModel>());
  });

  test('updateCompany', () async {
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    companyMock = companyMock.copyWith(name: "Alterado", userAdminId: user.user!.id);
    //Act
    final request = await repository.updateCompany(auth: user, company: companyMock);
    //Assert
    expect(request, isA<CompanyModel>());
  });

  test('createEstablishment', () async {
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    //Act
    final request = await repository.insertEstablishment(auth: user, companySlug: companyMock.slug!, establishment: establishmentMock);
    //Assert
    expect(request, isA<EstablishmentModel>());
  });

  test('updateEstablishment', () async {
    establishmentMock = establishmentMock.copyWith(fantasyName: "Trocamos de nome", id: 16, companySlug: companyMock.slug);
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    //Act
    final request = await repository.updateEstablishment(auth: user, establishment: establishmentMock);
    //Assert
    expect(request, isA<EstablishmentModel>());
  });
  test('deleteEstablishment', () async {
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    //Act
    await repository.deleteEstablishment(auth: user, establishment: establishmentMock);
    //Assert
  });
  test('deleteCompany', () async {
    //Arrange
    final user = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
    //Act
    await repository.deleteCompany(auth: user, company: companyMock);
    //Assert
  });

  test('slugExists', () async {
    //Arrange
    //Act
    final request = await repository.slugExists("paipfood");
    final requestF = await repository.slugExists("paipfoodTeste");
    //Assert
    expect(request, true);
    expect(requestF, false);
  });
}
