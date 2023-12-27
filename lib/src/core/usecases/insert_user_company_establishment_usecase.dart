import 'package:paipfood_package/paipfood_package.dart';

class InsertUserCompanyEstablishmentUsecase {
  final IAddressRepository addressRepo;
  final IAuthRepository authRepo;
  final IEstablishmentRepository establishmentRepo;
  InsertUserCompanyEstablishmentUsecase({
    required this.addressRepo,
    required this.authRepo,
    required this.establishmentRepo,
  });
  Future<void> call({required UserModel user, required String password, required CompanyModel company, required AddressModel address}) async {
    AuthModel auth = await authRepo.signUpByEmail(email: user.email!, password: password);

    company = company.copyWith(userAdminId: auth.user!.id);
    final company_ = await establishmentRepo.insertCompany(company: company, auth: auth);
    auth = auth.copyWith(user: user.copyWith(companySlug: company.slug, id: auth.user!.id));
    await authRepo.updateUser(auth: auth);

    final establishment =
        await establishmentRepo.insertEstablishment(establishment: company.establishments.first, auth: auth, companySlug: company_.slug);

    address = address.copyWith(establishmentId: establishment.id);
    await addressRepo.insert(address);
  }
}
