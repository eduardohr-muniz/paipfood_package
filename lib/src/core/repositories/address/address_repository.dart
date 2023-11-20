import 'package:paipfood_package/src/core/interfaces/zz_interfaces_export.dart';
import 'package:paipfood_package/src/core/repositories/address/i_address_repository.dart';

class AddressRepository implements IAddressRepository {
  final IHttp http;
  AddressRepository({
    required this.http,
  });
}
