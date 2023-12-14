import 'package:paipfood_package/paipfood_package.dart';
import 'i_items_repository.dart';

class ItemsRepository implements IItemsRepository {
  final HttpDio http;
  ItemsRepository({required this.http});
  @override
  Future<List<ItemModel>> getByEstablishmentId(int establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/items?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<ItemModel>((product) {
      return ItemModel.fromMap(product);
    }).toList();
  }

  @override
  Future<List<ItemModel>> upsert({required List<ItemModel> items, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/items",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: items.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<ItemModel>((product) {
      return ItemModel.fromMap(product);
    }).toList();
  }

  @override
  Future<void> delete({required int id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/items?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
