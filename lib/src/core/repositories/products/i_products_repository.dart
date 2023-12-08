import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IProductsRepository {
  Future<List<ProductModel>> getByEstablishmentId(int id);
  Future<ProductModel> insert({required ProductModel product, required AuthModel auth});
  Future<ProductModel> update({required ProductModel product, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
