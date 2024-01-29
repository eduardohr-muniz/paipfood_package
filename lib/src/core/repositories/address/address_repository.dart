import 'package:paipfood_package/env.dart';
import 'package:paipfood_package/src/core/interfaces/zz_interfaces_export.dart';
import 'package:paipfood_package/src/core/models/adapters/address_model.dart';
import 'package:paipfood_package/src/core/repositories/address/i_address_repository.dart';

class AddressRepository implements IAddressRepository {
  final IHttp http;
  AddressRepository({
    required this.http,
  });

  @override
  Future<void> deleteByUserId(String id) async {
    await http.delete("rest/v1/address?user_id=eq.$id");
  }

  @override
  Future<AddressModel> getByEstablishmentId(String id) async {
    final request = await http.get("rest/v1/address?establishment_id=eq.$id&select=*");
    final List list = request.data;
    final List<AddressModel> address = list.map<AddressModel>((address) {
      return AddressModel.fromMap(address);
    }).toList();
    return address.first;
  }

  @override
  Future<List<AddressModel>> getByUserId(String id) async {
    final request = await http.get("rest/v1/address?user_id=eq.$id&select=*");
    final List list = request.data;
    final List<AddressModel> address = list.map<AddressModel>((address) {
      return AddressModel.fromMap(address);
    }).toList();
    return address;
  }

  @override
  Future<AddressModel> insert(AddressModel address) async {
    final request = await http.post(
      "rest/v1/rpc/insert_address",
      data: {"p_json": address.toJson()},
      headers: {"Authorization": "Bearer ${Env.supaApiKey}"},
    );
    return AddressModel.fromMap(request.data);
  }

  @override
  Future<AddressModel> update(AddressModel address) async {
    final request = await http.patch(
      "rest/v1/address?id=eq.${address.id}",
      data: address.toJson(),
    );
    final List list = request.data;
    return list
        .map((address) {
          return AddressModel.fromMap(address);
        })
        .toList()
        .first;
  }
}
