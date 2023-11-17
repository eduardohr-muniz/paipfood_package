import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IEstablishmentRepository {
  Future<CompanyModel> createCompany({required CompanyModel company, required AuthModel auth});
  Future<CompanyModel> updateCompany({required CompanyModel company, required AuthModel auth});
  Future<CompanyModel?> getCompanyBySlug({required String slug});
  Future<List<CompanyModel>> getCompanies({RangeModel? range});
  Future<void> deleteCompany({required CompanyModel company, required AuthModel auth});
  Future<EstablishmentModel> createEstablishment({required EstablishmentModel establishment, required AuthModel auth, required CompanyModel company});
  Future<EstablishmentModel> updateEstablishment({required EstablishmentModel establishment, required AuthModel auth});
  Future<void> deleteEstablishment({required EstablishmentModel establishment, required AuthModel auth});
  Future<EstablishmentModel?> getEstablishmentById({required int id});
  Future<List<EstablishmentModel>> getEstablishments({RangeModel? range});
}
