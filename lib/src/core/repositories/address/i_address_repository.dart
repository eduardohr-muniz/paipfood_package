import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IAddressRepository {
  Future<AddressModel> getByEstablishmentId(String id);
  Future<List<AddressModel>> getByUserId(String id);
  Future<AddressModel> insert(AddressModel address);
  Future<AddressModel> update(AddressModel address);
  Future<void> deleteByUserId(String id);
}
