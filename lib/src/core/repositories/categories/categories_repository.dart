import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/categories/i_categories_repository.dart';

class CategoriesRepository implements ICategoriesRepository {
  final HttpDio http;
  CategoriesRepository({required this.http});
  @override
  Future<List<CategoryModel>> getByEstablishmentId(int establishmentId) async {
    final request = await http.get("rest/v1/categories?establishment_id=eq.$establishmentId&select=*");
    final List list = request.data;
    return list.map<CategoryModel>((category) {
      return CategoryModel.fromMap(category);
    }).toList();
  }

  @override
  Future<CategoryModel> insert({required CategoryModel category, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/categories",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: category.toJson(),
    );
    final List list = request.data;
    return list
        .map<CategoryModel>((category) {
          return CategoryModel.fromMap(category);
        })
        .toList()
        .first;
  }

  @override
  Future<CategoryModel> update({required CategoryModel category, required AuthModel auth}) async {
    final request = await http.patch(
      "rest/v1/categories?id=eq.${category.id}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: category.toJson(),
    );
    final List list = request.data;
    return list
        .map<CategoryModel>((category) {
          return CategoryModel.fromMap(category);
        })
        .toList()
        .first;
  }

  @override
  Future<void> delete({required int id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/categories?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
