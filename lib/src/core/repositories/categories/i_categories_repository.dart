import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ICategoriesRepository {
  Future<List<CategoryModel>> getByEstablishmentId(int establishmentId);
  Future<CategoryModel> insert({required CategoryModel category, required AuthModel auth});
  Future<CategoryModel> update({required CategoryModel category, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
