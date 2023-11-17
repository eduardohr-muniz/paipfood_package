import 'package:paipfood_package/src/core/repositories/i_establishment_repository.dart';

import '../../../paipfood_package.dart';

class EstablishmentRepository implements IEstablishmentRepository {
  final HttpDio http;
  EstablishmentRepository({
    required this.http,
  });

  @override
  Future<CompanyModel> createCompany({required CompanyModel company, required AuthModel auth}) {
    // TODO: implement createCompany
    throw UnimplementedError();
  }

  @override
  Future<EstablishmentModel> createEstablishment(
      {required EstablishmentModel establishment, required AuthModel auth, required CompanyModel company}) {
    // TODO: implement createEstablishment
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCompany({required CompanyModel company, required AuthModel auth}) {
    // TODO: implement deleteCompany
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEstablishment({required EstablishmentModel establishment, required AuthModel auth}) {
    // TODO: implement deleteEstablishment
    throw UnimplementedError();
  }

  @override
  Future<List<CompanyModel>> getCompanies({RangeModel? range}) async {
    final request = await http.get(
      "rest/v1/companies?select=*",
      headers: range?.toMap(),
    );
    return request.data.map<CompanyModel>((company) {
      return CompanyModel.fromMap(company);
    }).toList();
  }

  @override
  Future<CompanyModel?> getCompanyBySlug({required String slug}) async {
    final request = await http.get("rest/v1/companies?slug=eq.$slug&select=*");
    final List list = request.data;
    if (list.isEmpty) return null;
    return list
        .map<CompanyModel>((companie) {
          return CompanyModel.fromMap(companie);
        })
        .toList()
        .first;
  }

  @override
  Future<EstablishmentModel?> getEstablishmentById({required int id}) async {
    final request = await http.get("rest/v1/establishments?id=eq.$id&select=*");
    final List list = request.data;
    if (list.isEmpty) return null;
    return list
        .map<EstablishmentModel>((companie) {
          return EstablishmentModel.fromMap(companie);
        })
        .toList()
        .first;
  }

  @override
  Future<List<EstablishmentModel>> getEstablishments({RangeModel? range}) async {
    final request = await http.get(
      "rest/v1/companies?select=*",
      headers: range?.toMap(),
    );
    return request.data.map<EstablishmentModel>((establishment) {
      return EstablishmentModel.fromMap(establishment);
    }).toList();
  }

  @override
  Future<CompanyModel> updateCompany({required CompanyModel company, required AuthModel auth}) {
    // TODO: implement updateCompany
    throw UnimplementedError();
  }

  @override
  Future<EstablishmentModel> updateEstablishment({required EstablishmentModel establishment, required AuthModel auth}) {
    // TODO: implement updateEstablishment
    throw UnimplementedError();
  }
}
