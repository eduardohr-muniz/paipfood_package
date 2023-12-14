import 'package:paipfood_package/paipfood_package.dart';

class ProductsRepository implements IProductsRepository {
  final HttpDio http;
  ProductsRepository({required this.http});
  @override
  Future<List<ProductModel>> getByEstablishmentId(int establishmentId, {bool? visible}) async {
    String filterVisbile = "";
    if (visible != null) filterVisbile = HttpUtils.filterVisible(visible);
    final request = await http.get("rest/v1/products?establishment_id=eq.$establishmentId$filterVisbile&select=*");
    final List list = request.data;
    return list.map<ProductModel>((product) {
      return ProductModel.fromMap(product);
    }).toList();
  }

  @override
  Future<List<ProductModel>> upsert({required List<ProductModel> products, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/products",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: products.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<ProductModel>((product) {
      return ProductModel.fromMap(product);
    }).toList();
  }

  @override
  Future<void> delete({required int id, required AuthModel auth}) async {
    await http.delete(
      "rest/v1/products?id=eq.$id",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }
}
