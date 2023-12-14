import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/categories/i_categories_repository.dart';

class CategoriesRepository implements ICategoriesRepository {
  final HttpDio http;
  CategoriesRepository({required this.http});
  @override
  Future<List<CategoryModel>> getByEstablishmentId(int establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/categories?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<CategoryModel>((category) {
      return CategoryModel.fromMap(category);
    }).toList();
  }

  @override
  Future<List<CategoryModel>> upsert({required List<CategoryModel> categories, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/categories",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: categories.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<CategoryModel>((category) {
      return CategoryModel.fromMap(category);
    }).toList();
  }

  @override
  Future<void> delete({required int id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/categories?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
