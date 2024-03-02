import 'package:paipfood_package/paipfood_package.dart';

class GeoapifyRepository implements ISearchAddressRepository {
  final IHttp http;
  GeoapifyRepository({
    required this.http,
  });

  @override
  Future<List<AddressModel>> autoComplete(String query) async {
    final shortLocale = Intl.shortLocale(Intl.defaultLocale ?? "pt_BR");
    query = Uri.encodeComponent(query);
    final request = await http.get("v1/geocode/autocomplete?text=$query&format=json&lang=$shortLocale&apiKey=${Env.geoapifyApiKey}");
    final Geoapify geoapify = Geoapify.fromMap(request.data);
    return geoapify.results.map(AddressModelAdapter.geoapify).toList();
  }
}
