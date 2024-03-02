import 'package:paipfood_package/paipfood_package.dart';

class OpeningHoursRepository implements IOpeningHoursRepository {
  final HttpDio http;
  OpeningHoursRepository({required this.http});
  final table = 'opening_hours';
  @override
  Future<List<OpeningHoursModel>> getByEstablishmentId(String establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/$table?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<OpeningHoursModel>((openingHours) {
      return OpeningHoursModel.fromMap(openingHours);
    }).toList();
  }

  @override
  Future<List<OpeningHoursModel>> upsert({required List<OpeningHoursModel> openingHours, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/$table",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: openingHours.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<OpeningHoursModel>((openingHours) {
      return OpeningHoursModel.fromMap(openingHours);
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
