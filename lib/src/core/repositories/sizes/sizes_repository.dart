import 'package:paipfood_package/paipfood_package.dart';
import 'i_sizes_repository.dart';

class SizesRepository implements ISizesRepository {
  final HttpDio http;
  SizesRepository({required this.http});
  @override
  Future<List<SizeModel>> getByEstablishmentId(String establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/sizes?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<SizeModel>((product) {
      return SizeModel.fromMap(product);
    }).toList();
  }

  @override
  Future<List<SizeModel>> upsert({required List<SizeModel> sizes, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/sizes",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: sizes.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<SizeModel>((product) {
      return SizeModel.fromMap(product);
    }).toList();
  }

  @override
  Future<void> delete({required String id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/sizes?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
