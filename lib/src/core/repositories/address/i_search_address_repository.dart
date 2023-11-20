import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ISearchAddressRepository {
  Future<List<AddressModel>> autoComplete(String query);
}
