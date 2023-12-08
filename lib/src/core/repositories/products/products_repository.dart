import 'package:paipfood_package/paipfood_package.dart';

class ProductsRepository implements IProductsRepository {
  final HttpDio http;
  ProductsRepository({required this.http});
  @override
  Future<List<ProductModel>> getByEstablishmentId(int establishmentId) async {
    final request = await http.get("rest/v1/products?establishment_id=eq.$establishmentId&select=*");
    final List list = request.data;
    return list.map<ProductModel>((product) {
      return ProductModel.fromMap(product);
    }).toList();
  }

  @override
  Future<ProductModel> insert({required ProductModel product, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/products",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: product.toJson(),
    );
    final List list = request.data;
    return list
        .map<ProductModel>((product) {
          return ProductModel.fromMap(product);
        })
        .toList()
        .first;
  }

  @override
  Future<ProductModel> update({required ProductModel product, required AuthModel auth}) async {
    final request = await http.patch(
      "rest/v1/products?id=eq.${product.id}",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
      data: product.toJson(),
    );
    final List list = request.data;
    return list
        .map<ProductModel>((product) {
          return ProductModel.fromMap(product);
        })
        .toList()
        .first;
  }

  @override
  Future<void> delete({required int id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/products?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
