import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ICategoriesRepository {
  Future<List<CategoryModel>> getByEstablishmentId(String establishmentId, {bool? visible});
  Future<List<CategoryModel>> upsert({required List<CategoryModel> categories, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth});
}
