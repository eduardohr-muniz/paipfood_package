import 'package:intl/intl.dart';
import 'package:paipfood_package/env.dart';
import 'package:paipfood_package/src/core/interfaces/htpp/i_http.dart';
import 'package:paipfood_package/src/core/models/adapters/address_model_adapter.dart';
import 'package:paipfood_package/src/core/models/address_geoapify_model.dart';
import 'package:paipfood_package/src/core/models/address_model.dart';
import 'package:paipfood_package/src/core/repositories/address/i_search_address_repository.dart';

class GeoapifyRepository implements ISearchAddressRepository {
  final IHttp http;
  GeoapifyRepository({
    required this.http,
  });

  @override
  Future<List<AddressModel>> autoComplete(String query) async {
    final shortLocale = Intl.shortLocale(Intl.defaultLocale ?? "pt_BR");
    query = Uri.encodeComponent(query);
    final request = await http.get("autocomplete?text=$query&format=json&lang=$shortLocale&apiKey=${Env.geoapifyApiKey}");
    final Geoapify geoapify = Geoapify.fromMap(request.data);
    return geoapify.results.map(AddressModelAdapter.geoapify).toList();
  }
}
