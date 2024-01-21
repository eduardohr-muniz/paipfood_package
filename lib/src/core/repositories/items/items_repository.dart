import 'package:paipfood_package/paipfood_package.dart';

class ItemsRepository implements IItemsRepository {
  final HttpDio http;
  ItemsRepository({required this.http});
  final table = 'items';
  @override
  Future<List<ItemModel>> getByEstablishmentId(String establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/$table?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<ItemModel>((product) {
      return ItemModel.fromMap(product);
    }).toList();
  }

  @override
  Future<List<ItemModel>> upsert({required List<ItemModel> items, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/$table",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: items.map((e) => e.toMap(isComplete: false)).toList(),
    );
    final List list = request.data;
    return list.map<ItemModel>((product) {
      return ItemModel.fromMap(product);
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
