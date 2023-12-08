import 'package:paipfood_package/src/core/repositories/establishment/i_establishment_repository.dart';

import '../../../../paipfood_package.dart';

class EstablishmentRepository implements IEstablishmentRepository {
  final HttpDio http;
  EstablishmentRepository({
    required this.http,
  });

  @override
  Future<CompanyModel> insertCompany({required CompanyModel company, required AuthModel auth}) async {
    company = company.copyWith(userAdmId: auth.user!.id);

    final request = await http.post(
      "rest/v1/companies",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: company.toJson(),
    );

    final List list = request.data;
    return list
        .map((company) {
          return CompanyModel.fromMap(company);
        })
        .toList()
        .first;
  }

  @override
  Future<EstablishmentModel> insertEstablishment(
      {required EstablishmentModel establishment, required AuthModel auth, required String companySlug}) async {
    establishment = establishment.copyWith(companySlug: companySlug);

    final request = await http.post(
      "rest/v1/establishments",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: establishment.toJson(),
    );

    final List list = request.data;
    return list
        .map((establishment) {
          return EstablishmentModel.fromMap(establishment);
        })
        .toList()
        .first;
  }

  @override
  Future<void> deleteCompany({required CompanyModel company, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/companies?slug=eq.${company.slug}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }

  @override
  Future<void> deleteEstablishment({required EstablishmentModel establishment, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/establishments?id=eq.${establishment.id}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
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
      "rest/v1/establishments?select=*",
      headers: range?.toMap(),
    );
    return request.data.map<EstablishmentModel>((establishment) {
      return EstablishmentModel.fromMap(establishment);
    }).toList();
  }

  @override
  Future<CompanyModel> updateCompany({required CompanyModel company, required AuthModel auth}) async {
    final request = await http.patch(
      "rest/v1/companies?slug=eq.${company.slug}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: company.toJson(),
    );

    final List list = request.data;
    return list
        .map((company) {
          return CompanyModel.fromMap(company);
        })
        .toList()
        .first;
  }

  @override
  Future<EstablishmentModel> updateEstablishment({required EstablishmentModel establishment, required AuthModel auth}) async {
    final request = await http.patch(
      "rest/v1/establishments?id=eq.${establishment.id}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: establishment.toJson(),
    );

    final List list = request.data;
    return list
        .map((establishment) {
          return EstablishmentModel.fromMap(establishment);
        })
        .toList()
        .first;
  }

  @override
  Future<bool> slugExists(String slug) async {
    final request = await http.post(
      "rest/v1/rpc/slug_exists",
      headers: {"Authorization": "Bearer ${Env.supaApiKey}"},
      data: {"slug_company": Utils.onlyAlphanumeric(slug, undereline: true)},
    );
    return request.data;
  }
}
