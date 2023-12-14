import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ICategoriesRepository {
  Future<List<CategoryModel>> getByEstablishmentId(int establishmentId, {bool? visible});
  Future<List<CategoryModel>> upsert({required List<CategoryModel> categories, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
