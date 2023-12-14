import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IProductsRepository {
  Future<List<ProductModel>> getByEstablishmentId(int id, {bool? visible});
  Future<List<ProductModel>> upsert({required List<ProductModel> products, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
