import 'package:paipfood_package/paipfood_package.dart';

class LatLongsRepository implements ILatLongsRepository {
  final HttpDio http;
  LatLongsRepository({required this.http});

  final String table = 'lat_longs';

  @override
  Future<List<LatLongModel>> getByEstablishmentId(String establishmentId) async {
    final request = await http.get("rest/v1/$table?establishment_id=eq.$establishmentId&select=*");
    final List list = request.data;
    return list.map<LatLongModel>((latLongs) {
      return LatLongModel.fromMap(latLongs);
    }).toList();
  }

  @override
  Future<List<LatLongModel>> upsert({required List<LatLongModel> latLongs, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/$table",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: latLongs.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<LatLongModel>((latLongs) {
      return LatLongModel.fromMap(latLongs);
    }).toList();
  }

  @override
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted = false}) async {
    String query = "id=eq.$id";
    if (isDeleted) query = HttpUtils.queryIsDeleted(isDeleted);
    await http.delete(
      "rest/v1/$table?$query",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
