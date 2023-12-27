import 'package:paipfood_package/paipfood_package.dart';

class ComplementsRepository implements IComplementsRepository {
  final HttpDio http;
  ComplementsRepository({required this.http});
  @override
  Future<List<ComplementModel>> getByEstablishmentId(String establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/complements?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<ComplementModel>((product) {
      return ComplementModel.fromMap(product);
    }).toList();
  }

  @override
  Future<List<ComplementModel>> upsert({required List<ComplementModel> complements, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/complements",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: complements.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<ComplementModel>((product) {
      return ComplementModel.fromMap(product);
    }).toList();
  }

  @override
  Future<void> delete({required String id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/complements?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
